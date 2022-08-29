package ch.uzh.ifi.seal.soprafs19.dto.incoming;

import ch.uzh.ifi.seal.soprafs19.constant.GameCard;

import java.util.ArrayList;

public class CardCollectionMessage implements Message {
    private Long userId;
    private ArrayList<GameCard> cardCollection;

    public Long getUserId() {
        return userId;
    }

    public ArrayList<GameCard> getCardCollection() {
        return cardCollection;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setCardCollection(ArrayList<GameCard> cardCollection) {
        this.cardCollection = cardCollection;
    }
}
