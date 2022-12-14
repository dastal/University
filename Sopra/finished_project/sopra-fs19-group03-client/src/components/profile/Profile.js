import styled from "styled-components";
import {getDomain} from "../../helpers/getDomain";
import {BaseContainer} from "../../helpers/layout";
import {Button} from "../../views/design/Button";
import {withRouter} from "react-router-dom";
import {Game} from  "../game/Game";
import React from "react";
import {FormContainer, Form} from "../login/Login";
import {DateSelector} from "../../views/design/DateSelector";
import {ProfileGuard} from "../shared/routeProtectors/ProfileGuard";
import * as actionCreator from "../../store/actions/actions";
import {connect} from "react-redux";
import store from "../../index";
import {Spinner} from "../../views/design/Spinner";


const Label = styled.label`
  color: white;
  margin-bottom: 10px;
  text-transform: uppercase;
  display:block;
  font-size: ${props => (props.fontsize ? props.fontsize : "inherit")}
`;
const ProfileForm = styled(Form)`
  display: flex;
  justify-content: initial;
  padding-left: 0px;
  padding-right: 0px;
`;

const InfoContainer = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  border-radius: 5px;
  padding-left: 37px;
  padding-right: 37px;
  padding-top: 37px;
`;

const InfoContainerEdit = styled.div`
  border-radius: 5px;
  padding-left: 37px;
  padding-right: 37px;
  padding-top: 37px;
`;

const UserNameContainer = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: center;
  width: 100%;
  font-size: 120%;
  padding-left: 3em;
  padding-top: 0.5em;
  font-weight: bold;
  align-items: center;  
  text-align: center;
  border-bottom: skyblue solid 1px;
`;
const UserNameInput = styled.input`
  &::placeholder {
    color: rgba(255, 255, 255, 0.2);
  }
  height: 35px;
  padding-left: 15px;
  border: none;
  margin: auto;
  border-radius: 20px;
  margin-bottom: 15px;
  background: rgba(255, 255, 255, 0.2);
  color: white;
  text-align: center;
  vertical-align: middle;
`;

const UserName = styled.label`
  color: white;
  margin-bottom: 10px;
  text-transform: uppercase;
  width: 100%;
  text-align: center;
  vertical-align: middle;
`;

const OnlineLabel = styled(Label)`
  margin-top:1em ;
`;
export const OnlineState = styled.div`
    margin: 1em;
    background: ${props => (props.on ? "#01a509" : "#c10101")};
    width: 20px;
    height: 20px;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    justify-content: center;
`;
const CenterButton = styled(Button)`
    margin: auto;
`;

const InfoLabel = styled.div`
  font-weight: 200;
  color: white;
  padding-left: 20px;
  font-size: 120%;
  margin-bottom: 10px;
`;
const InfoInput = styled.input`
  &::placeholder {
    color: rgba(255, 255, 255, 0.2);
  }
  height: 35px;
  padding-left: 20px;
  border: none;
  border-radius: 20px;
  margin-bottom: 15px;
  font-size: 120%;
  background: rgba(255, 255, 255, 0.2);
  color: white;
  text-align: center;
  vertical-align: middle;
`;
const DescLabel = styled(Label)`
  color: #06c4ff;
  margin-bottom: 5px;
`;

export const ButtonContainer = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 20px;
`;

class Profile extends React.Component {
    constructor(props) {
        super(props);
        this.user = null;
        this.state = {
            id: this.props.match.params.id,
            user: null,
            editMode: false,
        }
    }

    handleCancel = () => {
        this.setState({editMode: false});
    };
    handleBack = () => {
        this.props.history.push("/game");
    };
    handleSave = () => {
        this.props.setUsername(localStorage.getItem("un"));
        window.location.reload();
    };
    handleEdit = () => {
        this.setState({editMode: true});
    };
    handleServerError = () => {
        this.setState({editMode: true});
    };

    fetchUserData(){
        let status;
        fetch(`${getDomain()}/users/${this.state.id}?token=${this.props.userToken}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json(), error => {
                this.props.history.push("/login");
            })
            .then(user => {
                // delays continuous execution of an async operation for 0.8 seconds.
                // This is just a fake async call, so that the spinner can be displayed
                // feel free to remove it :)
                try {
                    this.setState({"user": user}, () => {this.forceUpdate()});
                } catch (err) {
                    alert("Sorry something went wrong!" + err);
                    Game.logout();
                }
            })
            .catch(err => {
                console.log(err);
                alert("Something went wrong fetching the user: " + err);
            });
    }
    componentWillMount() {
        this.fetchUserData()
    }

    render() {
        if (this.state.user === null) {
            return null
        }
        return (
            <ProfileGuard>
                <BaseContainer>
                    <FormContainer>
                        {!this.state.user ? (
                            <Spinner/>
                        ) : (
                        <ProfileForm>
                            {!this.state.editMode ?
                                (
                                    <ProfileView user={this.state.user} onEdit={this.handleEdit}
                                                 onBack={this.handleBack}/>
                                ) : (
                                    <ProfileEdit user={this.state.user}
                                                 onCancel={this.handleCancel}
                                                 onSave={this.handleSave}
                                                 onServerError={this.handleServerError}
                                    />
                                )
                            }


                        </ProfileForm>
                            )}
                    </FormContainer>
                </BaseContainer>
            </ProfileGuard>
        );
    }

    birthDay() {
        if (this.state.user.birthDay === null) return "No Birthday available!";

        return (new Date(Number(this.state.user.birthDay))).toISOString().slice(0, 10);
    }

    creationDate() {
        return (new Date(Number(this.state.user.creationDate))).toISOString().slice(0, 10);
    }
}

class ProfileView extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            user: this.props.user,
        }
    }

    render() {
        return (
            <div>
                <UserNameContainer>
                    <Label>{this.state.user.id}</Label>
                    <UserName>{this.state.user.username}</UserName>
                    <OnlineLabel fontsize="50%">ONLINE</OnlineLabel>
                    <OnlineState on={this.state.user.status === "ONLINE"}/>
                </UserNameContainer>
                <InfoContainer>
                    <div>
                        <DescLabel>Full Name</DescLabel>
                        <InfoLabel>{this.state.user.name}</InfoLabel>
                        <DescLabel>Creation Date</DescLabel>
                        <InfoLabel>{this.creationDate()}</InfoLabel>
                        <DescLabel>Birthday</DescLabel>
                        <InfoLabel>{this.birthDay()}</InfoLabel>
                    </div>
                    <div>
                        <DescLabel>Games</DescLabel>
                        <InfoLabel>{this.state.user.games}</InfoLabel>
                        <DescLabel>Wins</DescLabel>
                        <InfoLabel>{this.state.user.wins}</InfoLabel>
                    </div>
                    <div>
                        <DescLabel>Win Percentage</DescLabel>
                        <InfoLabel>{Math.round(100*this.state.user.wins / this.state.user.games)} %</InfoLabel>
                    </div>
                </InfoContainer>
                <ButtonContainer>
                    <CenterButton
                        width="20%"
                        onClick={() => {
                            this.props.onBack();
                        }}
                    >
                        Back
                    </CenterButton>
                    {this.state.user.id === store.getState().myUserId ?
                        (
                            <CenterButton

                                width="30%"
                                onClick={() => {
                                    this.props.onEdit()
                                }}
                            >
                                Edit
                            </CenterButton>):null}
                </ButtonContainer>
            </div>
        )
    }

    birthDay() {
        if (this.state.user.birthDay === null) return "No Birthday available!";

        return (new Date(Number(this.state.user.birthDay))).toString().slice(0, 10);
    }

    creationDate() {
        return (new Date(Number(this.state.user.creationDate))).toString().slice(0, 10);
    }
}

class ProfileEdit extends React.Component {
    constructor(props) {
        super(props);
        this.birthday = null;
        this.name = null;
        this.username = null;
        this.state = {
            user: this.props.user,
        }
    }

    handleInvalidDate = () => {
        this.birthday = null;
    };
    handleValidDate = (value) => {
        this.birthday = value;
    };

    handleInputChange(key, value) {
        switch (key) {
            case "birthday":
                this.birthday = value;
                break;
            case "name":
                this.name = value;
                break;
            case "username":
                this.username = value;
                break;
        }
    }

    sendData() {
        let un = this.username ? this.username : this.state.user.username;
        let n = this.name ? this.name : this.state.user.name;
        let b = this.birthday ? this.birthday : this.state.user.birthDay;
        localStorage.setItem("un",un);
        fetch(`${getDomain()}/users/${this.state.user.id}?token=${store.getState().userToken}`, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({username: un, name: n, birthDay: b})
        }).then(response => {
            if (response.status === 409) alert("Username is already existing!");
            else if (response.status !== 204) throw new Error("Your Authentication is invalid. Login again!");
            this.props.onSave();
            this.props.onCancel();
        }).catch(err => {
            if (err.message.match(/Failed to fetch/)) {
                alert("The server cannot be reached. Did you start it?");
            } else {
                alert(`Something went wrong during the update: ${err.message}`);
                Game.logout();
            }
            this.props.onServerError();
        });
    }

    render() {
        return (
            <div>
                <UserNameContainer>
                    <Label>{this.state.user.id}</Label>

                    <UserNameInput
                        placeholder={this.state.user.username}
                        onChange={e => {
                            this.handleInputChange("username", e.target.value);
                        }}
                    />
                    <OnlineLabel fontsize="50%">ONLINE</OnlineLabel>
                    <OnlineState on={this.state.user.status === "ONLINE"}/>
                </UserNameContainer>
                <InfoContainerEdit>
                    <DescLabel>Full Name</DescLabel>
                    <InfoInput
                        placeholder={this.state.user.name}
                        onChange={e => {
                            this.handleInputChange("name", e.target.value);
                        }}
                    />
                    <DescLabel>Birthday</DescLabel>
                    <DateSelector onValidChange={this.handleValidDate} onInvalidChange={this.handleInvalidDate}/>
                </InfoContainerEdit>
                <ButtonContainer>
                    <CenterButton
                        width="20%"
                        onClick={() => {
                            this.props.onCancel()
                        }}
                    >
                        Cancel
                    </CenterButton>
                    <CenterButton
                        width="30%"
                        onClick={() => {
                            this.sendData();

                        }}
                    >
                        Save
                    </CenterButton>
                </ButtonContainer>
            </div>
        )
    }
}

const mapStateToProps = state => {
    return {
        userId: state.userId,
        userToken: state.userToken,
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
connect(mapStateToProps,mapDispatchToProps(ProfileEdit));
export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Profile));