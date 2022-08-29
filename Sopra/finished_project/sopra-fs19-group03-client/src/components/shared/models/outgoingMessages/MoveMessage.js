
class MoveMessage {
    constructor(authorization, move){
        this.authorization = authorization;
        this.move = move;
    }
    getAuthorization(){return this.authorization;}
    getMove(){return this.move;}
    setAuthorization(authorization){this.authorization = authorization;}
    setMove(move){this.move = move;}
}
export default MoveMessage;