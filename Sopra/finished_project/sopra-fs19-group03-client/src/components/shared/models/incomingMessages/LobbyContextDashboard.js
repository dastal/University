/**
 * Game Lobby model
 */

class LobbyContextDashboard {
  constructor(data = {}) {
    this.lobbyName = null;
    this.lobbyToken= null;
    this.id = null;
    this.GameMode = null;
    this.userCount = null;
    Object.assign(this, data);
  }
}
export default LobbyContextDashboard;
