package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import ch.uzh.ifi.seal.soprafs19.constant.GameCard;

public class GameCardMessage implements Message {


    private Long userId;
    private GameCard chosenCard;

    public Long getUserId() {
        return userId;
    }

    public GameCard getChosenCard() {
        return chosenCard;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setChosenCard(GameCard chosenCard) {
        this.chosenCard = chosenCard;
    }
}
