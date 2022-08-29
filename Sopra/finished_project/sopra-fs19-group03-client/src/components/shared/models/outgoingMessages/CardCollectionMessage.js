
import "../EnumsJS";



class CardCollectionMessage {
    constructor(id, collection){
        this.userId = id;
        this.cardCollection = collection;
    }
    getUserId(){return this.userId;}
    setUserId(id){this.userId = id;}
    getCollection(){return this.cardCollection;}
    setCollection(collection){this.cardCollection = collection;}
}
export default CardCollectionMessage;