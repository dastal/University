package ch.uzh.ifi.seal.soprafs19.dto.outgoing;

import ch.uzh.ifi.seal.soprafs19.constant.GameCard;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.Message;

import java.util.*;

public class SetupDto implements Message {
    private boolean loaded;
    private Long chooserId;
    private Long currentChooser;
    private List<GameCard> godCards;
    private Map<Long, GameCard> selectedGodCards;


    public List getGodCards() {
        return godCards;
    }

    public void setGodCards(ArrayList godCards) {
        this.godCards = godCards;
    }


    public boolean isLoaded() {
        return loaded;
    }

    public void setLoaded(boolean loaded) {
        this.loaded = loaded;
    }

    public Long getChooserId() {
        return chooserId;
    }

    public void setChooserId(Long chooserId) {
        this.chooserId = chooserId;
    }

    public Long getCurrentChooser() {
        return currentChooser;
    }

    public void setCurrentChooser(Long currentChooser) {
        this.currentChooser = currentChooser;
    }

    public Map<Long, GameCard> getSelectedGodCards() {
        return selectedGodCards;
    }

    public void setSelectedGodCards(HashMap<Long, GameCard> selectedGodCards) {
        this.selectedGodCards = selectedGodCards;
    }
}
