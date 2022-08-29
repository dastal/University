



export const UserStatus = Object.freeze({ONLINE : 0, OFFLINE : 1, PLAYING : 2});

export const ObjectType = Object.freeze({WORKER1 : 0 , WORKER2 : 1, BOTH : 2, BUILDING : 3, CUPOLA : 4});

export const MessageType = Object.freeze({MOVE : 0, LOGINCREDENTIALS : 1, AUTHORIZATIONCREDENTIALS : 2, READYSTATEMESSAGE : "READYSTATEMESSAGE", GAMESTATEMESSAGE : 4, MOVEMESSAGE : 5, CARDCOLLECTION : 6,
        GAMEMODEMESSAGE : 7, GAMECARDMESSAGE : 8, ACTIONTABLE : 9, LOADED : 10, STATECHANGE : 11, SETUPDTO : 12, LOBBYDTO : 13, LOBBYCONTEXTDASHBOARDDTO : 14,
        GAMEDTO : 15, LOBBYCONTEXTDTO : 16});

export const LobbyStatus = Object.freeze({LOBBY : 0, SETUP : 1, GAME : 2});

export const GameMode = Object.freeze({SIMPLE : 0, GODCARDS : 1});

export const GameCard = Object.freeze({STANDART : 0, APOLLO : 1, ATHENA : 2, DEMETER : 3, HERMES : 4, PAN : 5, ARTEMIS : 6, ATLAS : 7, HEPHAESTUS : 8, MINOTAURUS : 9, PROMETHEUS : 10});

export const Action = Object.freeze( {BUILD : 0, MOVE : 1, INITIALWORKER1 : 2, INITIALWORKER2 : 3});

