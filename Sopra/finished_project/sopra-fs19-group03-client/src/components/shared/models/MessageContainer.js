




class MessageContainer {
    constructor(type, message){
        this.type = type;
        this.message = message;
    }
    getType(){return this.type;}
    getMessage(){return this.message;}
    setType(type){this.type = type;}
    setMessage(message){this.message = message;}
}
export default MessageContainer;