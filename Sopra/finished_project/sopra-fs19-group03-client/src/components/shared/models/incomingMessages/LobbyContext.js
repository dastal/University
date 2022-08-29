import {User} from "User";


class LobbyContext {
    constructor(data = {}){
        this.lobbyToken = null;
        this.lobbyName = null;
        this.hostUserId = null;
        this.users = null;
        this.stateType = null;
        this.mode = null;
        Object.assign(this, data);
    }
}
export default LobbyContext;