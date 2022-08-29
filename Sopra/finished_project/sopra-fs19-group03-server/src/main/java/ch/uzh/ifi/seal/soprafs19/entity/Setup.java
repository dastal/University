package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.GameCard;
import ch.uzh.ifi.seal.soprafs19.constant.GameMode;
import ch.uzh.ifi.seal.soprafs19.constant.LobbyStatus;
import ch.uzh.ifi.seal.soprafs19.constant.MessageType;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.CardCollectionMessage;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.GameCardMessage;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.MessageContainer;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.ReadyStateMessage;
import ch.uzh.ifi.seal.soprafs19.entity.godCards.*;
import ch.uzh.ifi.seal.soprafs19.exceptions.MessageInvalidException;
import ch.uzh.ifi.seal.soprafs19.service.AccessHelper;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import java.util.*;

@Entity
public class Setup extends LobbyState {

    @Column
    private HashSet<Long> loadStates;

    @Column
    private boolean loaded;

    public HashSet<Long> getLoadStates() {
        return loadStates;
    }

    public Long getChooserId() {
        return chooserId;
    }

    public Long getCurrentChooser() {
        return currentChooser;
    }

    public ArrayList<Long> getPickList() {
        return pickList;
    }

    public List<GameCard> getGodCards() {
        return godCards;
    }

    public HashMap<Long, GameCard> getSelectedGodCards() {
        return selectedGodCards;
    }


    public LinkedList<Long> getTurnList() {
        return turnList;
    }

    @Column
    private Long chooserId;

    private Long currentChooser;

    private ArrayList<Long> pickList;

    @Column
    private ArrayList<GameCard> godCards;

    @Column
    @Lob
    private HashMap<Long, GameCard> selectedGodCards;

    private LinkedList<Long> turnList;

    public Setup() {
        super();
    }

    public Setup(HashSet<Long> userIds, LobbyContext context) {
        super(context);
        this.loadStates = userIds;
        this.loaded = false;
        this.type = LobbyStatus.SETUP;
        this.turnList = new LinkedList<>();
        setTurnList(userIds);
        this.loadStates = new HashSet<>(userIds);
        if (context.getMode() == GameMode.GODCARDS) {
            this.chooserId = setChooser(userIds);
            this.pickList = new ArrayList<>();
            setPickList(userIds);
            this.selectedGodCards = new HashMap<>();
            this.godCards = new ArrayList<>();
            this.currentChooser = this.pickList.get(0);
        }
        if (context.getMode().equals(GameMode.SIMPLE)) {
            setUserRulesetSimple(turnList);
        }
    }

    @Override
    public void update(MessageContainer message) throws MessageInvalidException {
        if (message.getType() == MessageType.READYSTATEMESSAGE) {
            updateLoading((ReadyStateMessage) message.getMessage());
        } else if (loaded) {
                if (message.getType() == MessageType.CARDCOLLECTION) {
                    setGodCards((CardCollectionMessage) message.getMessage());
                    AccessHelper.getLobbyController().convertAndSendLobbyState(context);
                } else if (message.getType() == MessageType.GAMECARDMESSAGE) {
                    selectCard((GameCardMessage) message.getMessage());
                    AccessHelper.getLobbyController().convertAndSendLobbyState(context);
                } else throw new MessageInvalidException();
        } else throw new MessageInvalidException("Not all users have loaded unity or message not a readymessage!");

        if ((this.pickList == null || this.pickList.isEmpty()) && loaded) {
                createGame();
        } else {
            AccessHelper.getLobbyService().updateLobbyState(this);
        }
    }

    private Long setChooser(HashSet<Long> Ids) {
        int size = Ids.size();
        int i = 0;
        int item = new Random().nextInt(size);
        for (Long obj : Ids) {
            if (i == item) {
                return obj;
            }
            i++;
        }
        return null;

    }

    private void setPickList(HashSet<Long> Ids) {
        Long lastOne = this.chooserId;
        Ids.remove(this.chooserId);
        ArrayList<Long> helpList = new ArrayList<>(Ids);
        Long youngest = findYoungest(helpList);

        helpList.remove(youngest);
        this.pickList.add(0, youngest);
        this.pickList.addAll(helpList);
        this.pickList.add(lastOne);
    }

    private void setTurnList(HashSet<Long> Ids) {
        ArrayList<Long> helpList = new ArrayList<>(Ids);
        Long youngest = findYoungest(helpList);
        helpList.remove(youngest);
        this.turnList.add(youngest);
        this.turnList.addAll(helpList);
    }

    private Long findYoungest(ArrayList<Long> list) {
        Long youngest = list.get(0);
        Long youngestBirthday = Long.parseLong(AccessHelper.getUserService().getUser(youngest.toString()).getBirthDay());
        for (int i = 1; i < list.size(); i++) {
            User user = AccessHelper.getUserService().getUser(list.get(i).toString());
            Long userBirthday = Long.parseLong(user.getBirthDay());
            if (userBirthday > youngestBirthday) {
                youngest = list.get(i);
                youngestBirthday = userBirthday;
            }
        }
        return youngest;
    }

    private void createGame() {
        AccessHelper.getLobbyService().changeStateToGame(context, turnList);
    }


    private void updateLoading(ReadyStateMessage message) {
        this.loadStates.remove(message.getUserId());
        if (this.loadStates.isEmpty()) {
            loaded = true;
            AccessHelper.getLobbyController().convertAndSendLobbyState(context);
        }
    }


    private void setGodCards(CardCollectionMessage message) {
        boolean already = false;
        for (int i=0; i < message.getCardCollection().size(); i++){
            if (this.godCards.contains(message.getCardCollection().get(i))){
                already = true;
            }
        }
        if (message.getUserId().equals(this.chooserId) && !already) {
            this.godCards = message.getCardCollection();
        } else {
            throw new MessageInvalidException();
        }
    }

    private void selectCard(GameCardMessage message) {
        if ((message.getUserId().equals(this.currentChooser)) && (this.pickList.contains(message.getUserId()))) {
            boolean found = false;
            for (Object card:
                 this.godCards) {
                if (card.toString().equals(message.getChosenCard().toString()))
                {found = true;
                break;}
            }
            if (found) {
                setUserRulesetGodCard(message.getChosenCard());
                this.selectedGodCards.put(this.currentChooser, message.getChosenCard());
                this.godCards.remove(message.getChosenCard());
                this.pickList.remove(message.getUserId());
                if (!pickList.isEmpty())
                    this.currentChooser = this.pickList.get(0);
            }
        }
    }

    private void setUserRulesetSimple(LinkedList<Long> users) {
        for (Long id:
             users) {
            AccessHelper.getUserService().setRulesetOfUser(id, new Ruleset(AccessHelper.getUserService().getUser(id)));

        }
    }
    //For Testing
    public void setLoaded(boolean loaded) {
        this.loaded = loaded;
    }

    //For Testing
    public void emptyLoadStates() {
        this.loadStates.clear();
    }

    private void setUserRulesetGodCard(GameCard card){
        User user = AccessHelper.getUserService().getUser(this.currentChooser);
        switch (card){
            case PAN:
                user.setRuleset(new Pan(user));
                break;
            case ATLAS:
                user.setRuleset(new Atlas(user));
                break;
            case ARTEMIS:
                user.setRuleset(new Artemis(user));
                break;
            case DEMETER:
                user.setRuleset(new Demeter(user));
                break;
            case HEPHAESTUS:
                user.setRuleset(new Hephaestus(user));
                break;
            case HERMES:
                user.setRuleset(new Hermes(user));
                break;
            case APOLLO:
                user.setRuleset(new Apollo(user));
                break;
            case ATHENA:
                user.setRuleset(new Athena(user));
                break;
            case PROMETHEUS:
                user.setRuleset(new Prometheus(user));
                break;
            case MINOTAUR:
                user.setRuleset(new Minotaur(user));
                break;
            default:
                throw new MessageInvalidException("GodCard does not exist!");
        }
    }

    public boolean isLoaded() {
        return loaded;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Setup)) {
            return false;
        }
        Setup lobby = (Setup) o;
        return this.getId().equals(lobby.getId());
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + id.hashCode();
        result = 31 * result + context.hashCode();
        return result;
    }
}


