
class AuthorizationCredentials{
    constructor(token, id){
        this.token = token;
        this.id = id;
    }

    getToken(){ return this.token;}
    setToken(token){this.token = token;}
    getId(){return this.id;}
    setId(id){this.id = id;}
}
export default AuthorizationCredentials;