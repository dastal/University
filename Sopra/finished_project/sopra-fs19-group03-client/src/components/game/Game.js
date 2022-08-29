import React from "react";
import styled from "styled-components";
import {BaseContainer} from "../../helpers/layout";
import {getDomain} from "../../helpers/getDomain";
import Player from "../../views/Player";
import {Spinner} from "../../views/design/Spinner";
import {Button} from "../../views/design/Button";
import {Link, withRouter} from "react-router-dom";
import {FormContainer} from "../login/Login";
import BasePopup from "reactjs-popup";
import SockJS from "sockjs-client"
import Stomp from "stomp-websocket"
import LobbyContainer from "../../views/LobbyContainer";
import User from "../shared/models/incomingMessages/User";
import LobbyContextDashboard from "../shared/models/incomingMessages/LobbyContextDashboard";
import { connect } from "react-redux";
import * as actionCreator from '../../store/actions/actions';

const Popup = styled(BasePopup)`
  background: unset !important;
  border: unset !important;
  width: 30% !important;
`;

const Container = styled(BaseContainer)`
  color: white;
  text-align: center;
  display: flex;
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

export const SpinnerContainer = styled.div`
  margin-bottom: 50px;
`;

const Linki = styled(Link)`
  color: white;
  text-underline: none;
  text-decoration: none;
`;

const FakeLink = styled.div`
  color: white;
  text-underline: none;
  text-decoration: none;
  cursor: pointer;
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




export class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            users: [],
            lobbies: [],
            lobbyToken: null,
        };
    }



    static logout(token) {
        fetch(`${getDomain()}/users/logout?token=${token}`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            method: "POST",
            body: JSON.stringify({token: token})
        }).then(response => {
            if (!response.ok) throw new Error(response.status);
        }).catch(err => {
            console.log(err);
        });
    }

    createLobby(mode, token = this.props.userToken){
        fetch(`${getDomain()}/dashboard/lobbies`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            method: "POST",
            body: JSON.stringify({token: token, mode})
            //localStorage.getItem(("token")), mode})

        }).then(response => {
            if (!response.ok) throw new Error(response.status);
            return response.text();
        }).then((text)=>{

            /* NEEDS TO BE DONE IN REDUX LATER!!!!*/
            this.props.setLobbyToken(text);
            this.props.history.push("/lobby");
        }).catch(err => {
            console.log(err);
        });
    }


    componentDidMount() {
        this.connect();

    }


    connect(){
        /*let status;
        fetch(`${getDomain()}/users/${this.props.myUserId}?token=${this.props.userToken}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
            /*.then(response => {
                status = response.status;
                console.log(status);
                if (status !== 500) {
                    this.props.history.push("/login");
                }
            });*/

        let socket = new SockJS(`${getDomain()}/dashboard`);
        let ws = Stomp.over(socket);

        ws.connect({}, frame => {
            console.log('Connected: ' + frame);

            let updateLobbies = message => {
                Game.lobbies = JSON.parse(message.body);
                this.setState({
                    lobbies: Game.lobbies
                });
            };

            this.lobbiesTopic = ws.subscribe('/topic/dashboard/lobbies', updateLobbies);
            this.lobbiesApp = ws.subscribe('/app/dashboard/lobbies', updateLobbies);

            let updateUsers = message => {
                Game.users = JSON.parse(message.body);
                this.setState({
                    users: Game.users
                });
            };

            this.usersTopic = ws.subscribe('/topic/dashboard/users', updateUsers);
            this.usersApp = ws.subscribe('/app/dashboard/users', updateUsers);
        });
        this.wsDash = ws;
    }


    send(){
        this.wsDash.send("/app/dashboard/lobbies", {}, JSON.stringify({'from':"me", 'text': "hoi"}));
    }



    joinLobby(id, oldThis, token = this.props.userToken){
        fetch(`${getDomain()}/lobbies/join/${id.toString()}?token=${token}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })

            .then(response => {
                // delays continuous execution of an async operation for 0.8 seconds.
                // This is just a fake async call, so that the spinner can be displayed
                // feel free to remove it :)
                try {
                    response.text().then(function (text) {
                        // REDUX done!!!!!!
                        oldThis.props.setLobbyToken(text);
                        oldThis.props.history.push("/lobby");
                    })


                } catch (err) {
                    alert("Sorry something went wrong!" + err);
                }
            }).catch(err => {
            console.log(err);
            alert("Something went wrong fetching the lobby: " + err);
        });

        /*fetch(`$${getDomain()}/lobbies/${id.toString()}?token=${localStorage.getItem("token")}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json(), error => {
                Game.logout();
            })
            .then(lobbyToken => {
                // delays continuous execution of an async operation for 0.8 seconds.
                // This is just a fake async call, so that the spinner can be displayed
                // feel free to remove it :)
                try {
                    localStorage.setItem("lobbyToken", lobbyToken)
                    console.log("hihihihihi")
                } catch {
                    alert("Sorry something went wrong!");
                    Game.logout();
                }
            })
            .catch(err => {
                console.log(err);
                alert("Something went wrong fetching the lobby: " + err);
            });*/

    }

    render() {
        return (
            <Container>
                <Form>

                    <h2>Users:</h2>

                        <div>
                            {this.state.users.length === 0 ? (
                                <SpinnerContainer><Spinner/></SpinnerContainer>
                            ) : (
                            <Users>
                                {this.state.users.map(user => {
                                    return (
                                        <Linki to={`/users/${user.id}`}>

                                            <PlayerContainer key={user.id}>
                                                <Player user={user} />
                                            </PlayerContainer>
                                        </Linki>
                                    );
                                })}
                            </Users>)}
                            <Button
                                width="100%"
                                onClick={() => {
                                    Game.logout(this.props.userToken);
                                    this.props.setUserId(null);
                                    this.props.setUsername(null);
                                    this.props.setUserToken(null);
                                    this.props.history.push("/login")
                                }}
                            >
                                Logout
                            </Button>
                        </div>

                </Form>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <Form>
                    <h2>Lobby:</h2>
                    {this.state.lobbies.length === 0? (
                        <div> No lobbies created yet </div>
                    ):( <div>
                        <Users>
                            {this.state.lobbies.map(lobby => {
                                return (
                                    <FakeLink>

                                        <PlayerContainer key={lobby.lobbyName}
                                                         onClick={
                                                             () => {

                                                                 /* NEEDS TO BE DONE IN REDUX LATER!!!!*/
                                                                 this.joinLobby(lobby.id, this);


                                                             }}>
                                            <LobbyContainer lobby={lobby} />
                                        </PlayerContainer>
                                    </FakeLink>
                                );
                            })}
                        </Users>
                    </div>)}
                    &nbsp;
                    <Popup trigger={<Button width="100%">
                        Create
                    </Button>}  modal>
                        {close => (
                            <Container>
                                <Button
                                    width="100%"
                                    onClick={() => {
                                        close();
                                        this.createLobby("godCards");
                                        this.lobbiesTopic.unsubscribe();
                                        this.lobbiesApp.unsubscribe();
                                        this.usersTopic.unsubscribe();
                                        this.usersApp.unsubscribe();

                                    }}
                                >
                                    God Mode
                                </Button>
                                <Button width="100%"
                                        onClick={() => {
                                            close();
                                            this.createLobby("simple");
                                            this.lobbiesTopic.unsubscribe();
                                            this.lobbiesApp.unsubscribe();
                                            this.usersTopic.unsubscribe();
                                            this.usersApp.unsubscribe();

                                        }}
                                >
                                    Simple Mode
                                </Button>
                            </Container>
                        )}
                    </Popup>
                </Form>
            </Container>
        );
    }
}

const mapStateToProps = state => {
    return {
        myUserId: state.myUserId,
        userToken: state.userToken,
        lobbyToken: state.lobbyToken,
    }
};

const mapDispatchToProps = (dispatch) =>{
    return {
        setUserId: (id) => dispatch(actionCreator.setUserId(id)),
        setUsername: (username) => dispatch(actionCreator.setUsername(username)),
        setUserToken: (token) => dispatch(actionCreator.setUserToken(token)),
        setLobbyToken: (token) => dispatch(actionCreator.setLobbyToken(token))
    }
};

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Game));