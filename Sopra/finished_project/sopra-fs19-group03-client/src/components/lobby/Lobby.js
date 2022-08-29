import styled from "styled-components";
import {getDomain} from "../../helpers/getDomain";
import {BaseContainer} from "../../helpers/layout";
import {Button} from "../../views/design/Button";
import {Link, withRouter} from "react-router-dom";
import {Game} from  "../game/Game";
import React from "react";
import GamePlayer from "../../views/GamePlayer";
import {Spinner} from "../../views/design/Spinner";
import User from "../shared/models/incomingMessages/User";
import SockJS from "sockjs-client";
import Stomp from "stomp-websocket";
import { connect } from "react-redux";
import * as actionCreator from '../../store/actions/actions';
import ReadyStateMessage from "../shared/models/outgoingMessages/ReadyStateMessage";
import MessageContainer from "../shared/models/MessageContainer";
import {MessageType} from "../shared/models/EnumsJS";

const FormContainer = styled.div`
  margin-top: 2em;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-height: 300px;
  justify-content: center;
  padding-left: 37px;
  padding-right: 37px;
`;

export const Form = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 360px;
  height: 100%;
  font-size: 16px;
  font-weight: 300;
  border-radius: 5px;
  padding-bottom: 37px;
  padding-left: 37px;
  padding-right: 37px;
  background: linear-gradient(rgb(20,20,20, 0.3), rgb(20,20,20, 0.3));
  transition: opacity 0.5s ease, transform 0.5s ease;
`;

const Title = styled.h2`
  margin: 5px;
  display: flex;
  flex-direction: row;
  justify-content: center;
  color: white;
  height: 50px;
  line-height: 50px;
  text-align: center;
`;

const Linki = styled(Link)`
  color: white;
  text-underline: none;
  text-decoration: none;
`;
const Users = styled.ul`
  list-style: none;
  padding-left: 0;
`;

const PlayerContainer = styled.li`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
`;

const GameMode = styled.div`
  display: flex;
  justify-content: flex-end;
  width: 20%;
  color: goldenrod;
  font-size: 50px;
`;

class Lobby extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            name: null,
            token: null,
            lobbyContext: null,
            gameMode: null,
            players: [],
            stateChange: null,
            readyUsers: [],
            readymessage: null
        };

    }

    connect(){
        let socket = new SockJS(`${getDomain()}/lobbies`);
        let ws = Stomp.over(socket);
        ws.connect({}, frame => {
            console.log('Connected: ' + frame);

            let updateLobbies = message => {
                let name = JSON.parse(message.body).lobbyName;
                this.setState({
                    name: name
                });


                Lobby.players = JSON.parse(message.body).users;
                this.setState({
                    players: Lobby.players
                });
                this.props.setPlayers(JSON.parse(message.body).users);

                Lobby.lobbyContext = JSON.parse(message.body).stateType;
                this.setState({
                    lobbyContext: Lobby.lobbyContext
                });

                Lobby.gameMode = JSON.parse(message.body).mode;
                this.setState({
                    gameMode: Lobby.gameMode
                });
                this.props.setGameMode(JSON.parse(message.body).mode);
            };

            let updateStateChange = message => {
                Lobby.stateChange = JSON.parse(message.body).lobbyStatus;
                this.setState({
                    stateChange: Lobby.stateChange
                });

                this.props.setGameState(JSON.parse(message.body).lobbyStatus);

                if (JSON.parse(message.body).lobbyStatus === "SETUP"){
                    this.props.history.push("/unity");
                    this.lobbiesTopic.unsubscribe();
                    this.lobbiesApp.unsubscribe();
                    this.lobbyTopic.unsubscribe();
                    this.lobbyApp.unsubscribe();
                    this.stateChangeTopic.unsubscribe();
                    this.stateChangeApp.unsubscribe();

                }

            };

            let updateLobbyState = message => {
                Lobby.readyUsers = JSON.parse(message.body).readyUsers;
                this.setState({
                    readyUsers: Lobby.readyUsers
                });
            };





            this.lobbiesTopic = ws.subscribe(`/topic/lobbies/${this.state.token}`, updateLobbies);
            this.lobbiesApp = ws.subscribe(`/app/lobbies/${this.state.token}`, updateLobbies);

            this.lobbyTopic = ws.subscribe(`/topic/lobbies/${this.state.token}/lobby`, updateLobbyState);
            this.lobbyApp = ws.subscribe(`/app/lobbies/${this.state.token}/lobby`, updateLobbyState);

            this.stateChangeTopic = ws.subscribe(`/topic/lobbies/${this.state.token}/stateChange`, updateStateChange);
            this.stateChangeApp = ws.subscribe(`/app/lobbies/${this.state.token}/stateChange`, updateStateChange);




        });
        this.wsLobby = ws;

    }

    sendUserToken() {
        this.wsLobby.send(`/app/lobbies/${this.state.token}/stateUpdate`, {}, JSON.stringify(this.props.userToken));
    }

    ready(userId){
        this.wsLobby.send(`/app/lobbies/${this.state.token}/lobby`, {}, JSON.stringify(new ReadyStateMessage(userId, true)));
    }

    leaveLobby(){


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






        this.lobbiesApp.unsubscribe();
        this.lobbyTopic.unsubscribe();
        this.lobbyApp.unsubscribe();
        this.stateChangeTopic.unsubscribe();
        this.stateChangeApp.unsubscribe();
    }

    componentDidMount() {

        //NEEDS TO BE DONE IN REDUX LATER!!!//

        this.setState({token: this.props.lobbyToken});
        this.connect();
        //this.setState({token: localStorage.getItem("lobbyToken")});


    }

    addUser() {
        this.setState({
            players: [...this.state.players, new User()]
        });
        /*this.setState({
            users: users
        })*/
    }


    render() {

        return (
            <BaseContainer>
                <FormContainer>
                    {!this.state.name ? (
                        <Spinner/>
                    ) : (
                    <Form>
                        <Title>
                            <div>{this.state.name}</div>
                            <GameMode>{this.state.gameMode === null ? (
                                ""
                            ) : (this.state.gameMode.charAt(0))}</GameMode>
                        </Title>
                        {!this.state.players ? (
                            <Spinner/>
                        ) : (
                            <Users>
                                {this.state.players.map(user => {
                                    return (
                                        <PlayerContainer key={user.id}>
                                            <GamePlayer user={user} lobby={this.state.players.length} Lobby={this} readyUsers = {this.state.readyUsers}/>
                                        </PlayerContainer>
                                    );
                                })}
                            </Users>
                        )}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <Button
                            width="100%"
                            onClick={() => {
                                this.leaveLobby();
                            }}
                        >
                            Leave
                        </Button>

                    </Form>
                    )}
                </FormContainer>
            </BaseContainer>
        )
    }


}

const mapStateToProps = state => {
    return {
        userToken: state.userToken,
        lobbyToken: state.lobbyToken,
    }
};

const mapDispatchToProps = (dispatch) =>{
    return {
        setLobbyToken: (token) => dispatch(actionCreator.setLobbyToken(token)),
        setPlayers: (players) => dispatch(actionCreator.setPlayers(players)),
        setGameMode: (gameMode) => dispatch(actionCreator.setGameMode(gameMode)),
        setGameState: (gameState) => dispatch(actionCreator.setGameState(gameState)),
    }
};


export default withRouter(connect(mapStateToProps,mapDispatchToProps)(Lobby));