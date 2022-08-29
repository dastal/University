
class LobbyDto {
    constructor(data = {}){
       this.readyUsers = null;
       Object.assign(this, data);
    }
}
export default LobbyDto;