
class LobbyCredentials {
    constructor(token, mode){
        this.token = token;
        this.mode = mode;
    }
    setToken(token){this.token = token;}
    getToken(){return this.token;}
    setMode(mode){this.mode = mode;}
    getMode(){return this.mode;}
}
export default LobbyCredentials;