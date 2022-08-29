const initialState = {
    // User/Lobby information
    myUserId: null,
    username: null,
    userToken: null,
    lobbyToken: null,
    players: [],
    gameMode: null,
    gameState: null,
    myGodCard: null,
    //Game State
    currentUser: null,
    winner: null,
    workerOwner: [
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ]
    ],
    workerType: [
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ]
    ],
    buildings: [
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ]
    ],
    cupola: [
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ],
        [ 0, 0, 0, 0, 0 ]
    ],
    // Action Table
    actions: [
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ],
        [ null, null, null, null, null ]
    ],
    actionType: null,
    skippable: null,
};

const reducer = (state=initialState, action) => {
    const newState = {...state};

    switch (action.type) {
        case "UPDATE_GAME":
            newState.currentUser = action.value.currentUser;
            newState.winner = action.value.winner;
            newState.workerOwner = action.value.workerOwner;
            newState.workerType = action.value.workerType;
            newState.buildings = action.value.buildings;
            newState.cupola = action.value.cupola;
            break;
        case "UPDATE_ACTION_TABLE":
            newState.actions = action.value.actions;
            newState.actionType = action.value.actionType;
            newState.skippable = action.value.skippable;
            break;
        case "SET_PLAYERS":
            newState.players = action.value;
            break;
        case "SET_GAMEMODE":
            newState.gameMode = action.value;
            break;
        case "SET_GAMESTATE":
            newState.gameState = action.value;
            break;
        case "SET_MYGODCARD":
            newState.myGodCard = action.value;
            break;
        case "SET_USER_ID":
            newState.myUserId = action.value;
            break;
        case "SET_USERNAME":
            newState.username = action.value;
            break;
        case "SET_TOKEN_USER":
            newState.userToken = action.value;
            break;
        case "SET_TOKEN_LOBBY":
            newState.lobbyToken = action.value;
            break;
        case "INCR":
            newState.id += action.value;
            break;
        case "DECR":
            newState.id -= action.value;
            break;
    }
    return newState;
};


export default reducer;