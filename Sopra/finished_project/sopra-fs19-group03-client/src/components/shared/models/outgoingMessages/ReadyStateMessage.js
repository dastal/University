import "../EnumsJS";

class ReadyStateMessage {
    constructor(userId, ready){
        this.userId = userId;
        this.ready = ready;
    }
    getUserId(){return this.userId;}
    getReady(){return this.ready;}
    setUserId(userId){this.userId = userId;}
    setReady(ready){this.ready = ready;}
}
export default ReadyStateMessage;