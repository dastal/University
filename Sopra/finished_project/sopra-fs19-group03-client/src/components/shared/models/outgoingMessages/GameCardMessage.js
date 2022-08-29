
import "../EnumsJS";


class GameCardMessage {
    constructor(userId, chosenCard){
        this.userId = userId;
        this.chosenCard = chosenCard;
    }
    getUserId(){return this.userId;}
    setUserId(userId){this.userId = userId;}
    getChosenCard(){return this.chosenCard;}
    setChosenCard(chosenCard){this.chosenCard = chosenCard;}
}
export default GameCardMessage;