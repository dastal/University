import React from "react";
import styled from "styled-components";
import {withRouter} from "react-router-dom";
import UnityDefault, { UnityContent } from "react-unity-webgl";
import { connect } from "react-redux";
import * as actionCreator from '../../store/actions/actions';
import SockJS from "sockjs-client";
import Stomp from "stomp-websocket";
import MessageContainer from "../../components/shared/models/MessageContainer";
import {MessageType} from "../../components/shared/models/EnumsJS";
import MoveMessage from "../../components/shared/models/outgoingMessages/MoveMessage";
import AuthorizationCredentials from "../../components/shared/models/outgoingMessages/AuthorizationCredentials";
import ReadyStateMessage from "../shared/models/outgoingMessages/ReadyStateMessage";
import {getDomain} from "../../helpers/getDomain";
import {BaseContainer} from "../../helpers/layout";


export const Unity = styled(UnityDefault)`
  & > canvas {
      display: block;
      height: 100vh;
      width: 100vw;
  }
`;


class UnityGame extends React.Component {


    constructor(props) {
        super(props);
        this.state = {
            password: null,
            username: null,
            requestValid: true,
        };
        this.unityContent = new UnityContent(
            "../Unity/Build/Unity.json",
            "../Unity/Build/UnityLoader.js"
        );
        this.unityContent.on("myOtherFunction", message => {
            alert(message);
        });

        this.unityContent.on("sendChat", message => {
            console.log(message + " this is message");
            this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/chat`, {}, JSON.stringify({authorization: {token: this.props.userToken, id: this.props.myUserId}, chatMessage: {username: this.props.username, message: message}}));
        });

        this.unityContent.on("returnToLobby", () => {

            this.props.history.push("/lobby");
            window.location.reload();

        });

        this.unityContent.on("fastForward", () => {

            this.state.message = JSON.stringify({token: this.props.userToken, id: this.props.myUserId});
            this.fastForward(this.state.message)
        });

        //unityContent object defined WebGL build.

        //Create listener for Unity Events. The event is called "movementData" and "message" gets passed from Unity. Second parameter is a function.
        this.unityContent.on("movementData", message => {

            // the received message gets packed into a local message and the token and id are added.
            this.state.message = JSON.stringify({authorization: {token: this.props.userToken, id: this.props.myUserId}, move: JSON.parse(message)});

            //send the new message to the websocket endpoint
            this.sendMove(this.state.message);

        });


        this.unityContent.on("startedGame", () => {

            let socket = new SockJS(`${getDomain()}/lobbies`);
            let ws = Stomp.over(socket);
            ws.connect({}, frame => {
                console.log('Connected: ' + frame);
                if (this.props.gameMode === "GODCARDS") {
                    this.unityContent.send(
                        "UnityReceiver",
                        "SetMyGodCard",
                        this.props.myGodCard,
                    );
                }

                let updateGameState = message => {
                    this.unityContent.send(
                        "UnityReceiver",
                        "UpdateGameState",
                        ((message.body)),
                        console.log(JSON.stringify(message.body))

                    );
                    this.props.updateGame(JSON.parse(message.body));

                };
                let updateActionTable = message => {
                    this.unityContent.send(
                        "UnityReceiver",
                        "UpdateActionTable",
                        ((message.body)),
                        console.log(JSON.stringify(message.body))
                    );
                };

                let getChatMessage = message => {
                    this.unityContent.send(
                        "UnityReceiver",
                        "GetChat",
                        ((message.body))
                    );
                };

                let getError = message => {
                    alert(JSON.parse(message.body))
                };

                this.GameStateApp = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/game`, updateGameState);
                this.FastForwardApp = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/game/fastforward`, updateGameState);
                this.GameStateTopic = ws.subscribe(`/topic/lobbies/${this.props.lobbyToken}/game`, updateGameState);
                this.ActionTableApp = ws.subscribe(`/app/user/${this.props.myUserId}/lobbies/${this.props.lobbyToken}/game/actions`, updateActionTable);
                this.ActionTableTopic= ws.subscribe(`/topic/user/${this.props.myUserId}/lobbies/${this.props.lobbyToken}/game/actions`, updateActionTable);

                this.ChatTopic= ws.subscribe(`/topic/lobbies/${this.props.lobbyToken}/chat`, getChatMessage);


                this.ErrorTopic= ws.subscribe(`/topic/errors`, getError);



            });
            this.wsLobby = ws;
        });

        this.unityContent.on("launchedUnity", () => {

            this.ready(this.props.myUserId);



            this.unityContent.send(
                "UnityReceiver",
                "SetGameMode",
                this.props.gameMode
            );


            this.sendStateToUnity();




            var i;
            for (i = 0; i < this.props.players.length; i++){
                //redux
                this.state.message = JSON.stringify({username: this.props.players[i].username, id: this.props.players[i].id, myId: this.props.myUserId});

                this.unityContent.send(
                    "UnityReceiver",
                    "SetMyUser",
                    this.state.message,
                    //   console.log(this.state.message)
                );
            }


        });

        this.unityContent.on("chosenCards", message => {

            this.sendChosenCards(message);

        });

        this.unityContent.on("leave", () => {

            fetch(`${getDomain()}/lobbies/leave/${this.props.lobbyToken}?token=${this.props.userToken}`, {
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                method: "POST"

            }).then(response => {
                if (!response.ok) throw new Error(response.status);
                return response.text();
            }).catch(err => {
                console.log(err);
            });

            this.props.setLobbyToken(null);
            this.props.setGameMode(null);
            this.props.history.push(`/game`);
            window.location.reload();






            this.GameStateApp.unsubscribe();
            this.FastForwardApp.unsubscribe();
            this.GameStateTopic.unsubscribe();
            this.ActionTableApp.unsubscribe();
            this.ActionTableTopic.unsubscribe();

            this.lobbyApp .unsubscribe();
            this.setupTopic.unsubscribe();
            this.setupTopic.unsubscribe();
            this.chosenCards.unsubscribe();
            this.pickedCard.unsubscribe();
            this.stateChangeTopic.unsubscribe();
            this.stateChangeApp.unsubscribe();
        });
        this.unityContent.on("forceLeave", () => {
            alert("A cowardly user left your game early. You have to restart the game :( Sorry! ");
            this.props.history.push(`/lobby`);
            window.location.reload();


            this.GameStateApp.unsubscribe();
            this.FastForwardApp.unsubscribe();
            this.GameStateTopic.unsubscribe();
            this.ActionTableApp.unsubscribe();
            this.ActionTableTopic.unsubscribe();

            this.lobbyApp .unsubscribe();
            this.setupTopic.unsubscribe();
            this.setupTopic.unsubscribe();
            this.chosenCards.unsubscribe();
            this.pickedCard.unsubscribe();
            this.stateChangeTopic.unsubscribe();
            this.stateChangeApp.unsubscribe();
        });

        this.unityContent.on("chosenCard", message => {

            this.sendChosenCard(message);

        });

        this.unityContent.on("myGodCard", message => {

            this.props.setMyGodCard(message);

        });
    }

    sendStateToUnity(){
        this.unityContent.send(
            "UnityReceiver",
            "SetGameState",
            this.props.gameState
        );
    }

    connect(){

        let socket = new SockJS(`${getDomain()}/lobbies`);
        let ws = Stomp.over(socket);
        ws.connect({}, frame => {
            console.log('Connected: ' + frame);



            let updateSetup = message => {

                if(JSON.parse(message.body).loaded === true){

                    this.unityContent.send(
                        "UnityReceiver",
                        "AllPlayersReady"
                    );
                }

                if(JSON.parse(message.body).loaded === true){

                    this.unityContent.send(
                        "UnityReceiver",
                        "UpdateSetupState",
                        (message.body),
                        console.log(JSON.stringify(message.body))
                    );
                }

            };

            let updateStateChange = message => {
                this.props.setGameState(JSON.parse(message.body).lobbyStatus);

                this.sendStateToUnity();

            };

            let updateGameState = message => {
                this.props.setGameState(JSON.parse(message.body).lobbyStatus);


            };

            let updateActionTable = message => {
                // console.log("MESS:" + message);
                //  console.log("BODY:" + message.body);
                this.props.updateActionTable(JSON.parse(message.body));
            };

//redux
            this.lobbyApp = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/lobby`);

            this.setupTopic = ws.subscribe(`/topic/lobbies/${this.props.lobbyToken}/setup`, updateSetup);
            this.setupTopic = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/setup`, updateSetup);

            this.chosenCards = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/setup/collection`);
            this.pickedCard = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/setup/pick`);

            this.stateChangeTopic = ws.subscribe(`/topic/lobbies/${this.props.lobbyToken}/stateChange`, updateStateChange);
            this.stateChangeApp = ws.subscribe(`/app/lobbies/${this.props.lobbyToken}/stateChange`, updateStateChange);










        });
        this.wsLobby = ws;
    }
//redux
    ready(userId){
        this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/lobby`, {}, JSON.stringify(new ReadyStateMessage(userId, true)));
    }



    componentDidMount(){
        this.connect();
        //this.connectGame();
        //this.connectActionTable();
    }

    componentWillUnmount() {
        /*this.unityContent.send(
            "UnityReceiver",
            "Quit"
        );*/
    }

    // call actual function in unity:
    click(){
        this.unityContent.send(
            "UnityReceiver",
            "MyFunctionInUnity",
            "hi unity"
        );
        //console.log(localStorage.getItem("username"));
    }



    sendMove(move) {
        //console.log(JSON.stringify(new MoveMessage(new AuthorizationCredentials(this.props.userToken,this.props.myUserId),move)));
        this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/game`, {}, move);
    }

    fastForward(cred) {
        //console.log(JSON.stringify(new MoveMessage(new AuthorizationCredentials(this.props.userToken,this.props.myUserId),move)));
        this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/game/fastforward`, {}, cred);
    }

    sendChosenCards(cards){
        this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/setup/collection`, {}, cards);
    }

    sendChosenCard(card){
        this.wsLobby.send(`/app/lobbies/${this.props.lobbyToken}/setup/pick`, {}, card);
    }

    render() {
        return (

            <Unity unityContent={this.unityContent}/>


        );
    }
}

const mapStateToProps = state => {
    return {
        username: state.username,
        myUserId: state.myUserId,
        userToken: state.userToken,
        lobbyToken: state.lobbyToken,
        players: state.players,
        gameMode: state.gameMode,
        gameState: state.gameState,
        myGodCard: state.myGodCard,
        // GAMESTATE: to access: this.props.currentUser
        currentUser: state.currentUser,
        winner: state.winner,
        workerOwner: state.workerOwner,
        workerType: state.workerType,
        buildings: state.buildings,
        cupola: state.cupola,
        // ACTION TABLE:
        userId: state.userId,
        actions: state.actions,
        actionType: state.actionType,
    }
};

const mapDispatchToProps = (dispatch) =>{
    return {
        // call: this.props.move(JSON)
        setLobbyToken: (token) => dispatch(actionCreator.setLobbyToken(token)),
        setGameMode: (gameMode) => dispatch(actionCreator.setGameMode(gameMode)),
        move: (move) => dispatch(actionCreator.move(move)),
        updateGame: (game) => dispatch(actionCreator.updateGame(game)),
        updateActionTable: (actionTable) => dispatch(actionCreator.updateActionTable(actionTable)),
        setGameState: (gameState) => dispatch(actionCreator.setGameState(gameState)),
        setMyGodCard: (myGodCard) => dispatch(actionCreator.setMyGodCard(myGodCard)),
    }
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(UnityGame));
