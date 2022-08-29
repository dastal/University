package ch.uzh.ifi.seal.soprafs19.entity.godCards;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Move;
import ch.uzh.ifi.seal.soprafs19.entity.Game;
import ch.uzh.ifi.seal.soprafs19.entity.Ruleset;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.service.AccessHelper;

import javax.persistence.Entity;

@Entity
public class Athena extends Ruleset {
    public Athena(User ownerUser){ super(ownerUser);}
    public Athena(){super();}

    @Override
    protected void checkWinner(Game state, Move move, Move lastMove) {
        super.checkWinner(state, move, lastMove);
        if (state.getBuildings()[move.getRow()][move.getColumn()] > state.getBuildings()[lastMove.getRow()][lastMove.getColumn()]) {
            for (Long userId:
                 state.getUserSequence()) {
                if (!userId.equals(getUser().getId())){
                    User local = AccessHelper.getUserService().getUser(userId);
                    //User local = NonServerApplication.users.get(userId.intValue()-1); // for local debugging
                    Ruleset localRuleset = local.getRuleset();
                    localRuleset.setMaxRaise(0);
                }
            }
        }
    }
}
