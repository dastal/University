
import "../EnumsJS";

class StateChangeMessage {
    constructor(data = {}){
        this.lobbyStatus = null;
        Object.assign(data);
    }
}
export default StateChangeMessage;