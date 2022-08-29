
import "../EnumsJS";





class GameDto {
    constructor(data = {}){
        this.id = null;
        this.token = null;
        this.currentUser = null;
        this.winner = null;
        this.workerOwner = null;
        this.workerType = null;
        this.buildings = null;
        this.cupola = null;
        Object.assign(this, data);
    }
}
export default GameDto;