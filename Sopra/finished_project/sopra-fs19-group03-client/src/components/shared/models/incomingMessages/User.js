/**
 * User model
 */

class User {
  constructor(data = {}) {
    this.id = null;
    this.name = null;
    this.username = null;
    this.password = null;
    this.token = null;
    this.status = null;
    this.wins = null;
    this.games = null;
    this.moves = null;
    this.birthDay =null;
    this.creationDate = null;
    this.readyToPlay = false;
    Object.assign(this, data);
  }
}
export default User;
