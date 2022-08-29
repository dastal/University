

export const setUserId = (id) => {
    return {type: "SET_USER_ID", value: id};
};

export const setPlayers = (players) => {
    return {type: "SET_PLAYERS", value: players};
};

export const setGameMode = (gameMode) => {
    return {type: "SET_GAMEMODE", value: gameMode};
};

export const setGameState = (gameState) => {
    return {type: "SET_GAMESTATE", value: gameState};
};

export const setMyGodCard = (myGodCard) => {
    return {type: "SET_MYGODCARD", value: myGodCard};
};

export const setUsername = (username) => {
    return {type: "SET_USERNAME", value: username};
};

export const setUserToken = (token) => {
    return {type: "SET_TOKEN_USER", value: token};
};

export const setLobbyToken = (token) => {
    return {type: "SET_TOKEN_LOBBY", value: token};
};

export const updateGame = (game) =>{
    return {type: "UPDATE_GAME", value: game}
};

export const updateActionTable = (actionTable) =>{
    return {type: "UPDATE_ACTION_TABLE", value: actionTable}
};

export const move = (move) =>{
    return dispatch => {
        //this.wsGame.send(`/app/lobbies/${this.props.lobbyToken}/game`, {}, JSON.stringify(new MessageContainer(MessageType.MOVEMESSAGE, new MoveMessage(new AuthorizationCredentials(state.userToken,state.userId),move))));
        // MOVED TO UNITY.js
            dispatch(updateGame());
    }
};


export const incrementA = (val) => {
    return {type:'INCR', value: val};
};

export const incr = val => {
    return dispatch => {
        setTimeout(() =>{
            dispatch(incrementA(val));
        },3000)
    }
};

export const decrement = (val) => {
    return {type:'DECR', value: val}
};