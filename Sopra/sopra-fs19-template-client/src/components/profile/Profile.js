import React from "react";
import styled from "styled-components";
import { BaseContainer } from "../../helpers/layout";
import { getDomain } from "../../helpers/getDomain";
import { withRouter } from "react-router-dom";
import { Button } from "../../views/design/Button";
import {Game} from "../game/Game";
import {ProfileGuard} from "../shared/routeProtectors/ProfileGuard";


const Container = styled(BaseContainer)`
  color: white;
  text-align: center;
`;

const Label = styled.label`
  color: deepskyblue;
  margin-bottom: 10px;
  display: block;
  text-transform: uppercase;
  font-weight: bold;
`;

const Text = styled.text`
  color: white; 
  display: block;
  margin-bottom: 10px;
  text-transform: none;
`

const UserCase = styled.div`
  display: flex;
  justify-content: center;
  flex-direction: row;
  width: 100%;
  font-size: 120%;
  padding-top: 0.5em;
  font-weight: bold;
`

const ButtonContainer = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 20px;
  flex-direction: row; 
`;

const RightColumn = styled.div`
  flex-direction: column;  
  text-align: left;
  margin-left: 25px; 
`

const LeftColumnView = styled.div`
  flex-direction: column;
  text-align: left;
  margin-right: 25px;
`

const LeftColumnEdit = styled.div`
  flex-direction: column;
  text-align: left;
  margin-right: 25px; 
  line-height: 40px; 
`

const DistancedButton = styled(Button)`
  margin: 20px;
`

const InfoChange = styled.input` 
  &::placeholder{
  color: rgba(255, 255, 255, 0.3) ;
  }
  display: flex;
  padding-left: 15px;
  flex-direction: column;
  height: 35px; 
  border: none; 
  border-radius: 20px;
  margin-bottom: 15px;
  background: rgba(255, 255, 255, 0.2);
  color: white;
  text-align: left;
  vertical-align: middle;
  
`

class Profile extends React.Component {
    constructor(props) {
        super(props);
        this.user = null;
        this.state = {
            id: this.props.match.params.id,
            user: null,
            editMode: false
        }
    }

    handleBack = () => {
        this.props.history.push("/game");
    };

    handleEdit = () => {
        this.setState({editMode: true})
    };

    handleSave = () => {
        window.location.reload();
    };

    handleCancel = () => {
        this.setState({editMode: false});
    };

    handleServerError = () => {
        this.setState({editMode: true});
    };

    fetchUserData(){
        let status;
        fetch(`${getDomain()}/users/${this.state.id}?token=${localStorage.getItem("token")}`, {
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
                    alert("Sorry something went wrong! " + err);
                    Game.logout();
                    localStorage.removeItem("token");
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

    render(){
        if(this.state.user === null){ return null }
        return (
            <Container>
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
            </Container>
        );
    }
}

class ProfileView extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            user: this.props.user,
        }
    }

    creationDate() {
        return(new Date(Number(this.state.user.creationDate))).toDateString();
    }

    render () {
        return (
            <div>
                <UserCase>
                    <LeftColumnView>
                        <Label>id: </Label>
                        <Label>Username:</Label>
                        <Label>Name:</Label>
                        <Label>CREATION DATE:</Label>
                        <Label>BIRTHDAY:</Label>
                    </LeftColumnView>
                    <RightColumn>
                        <Text> {this.state.user.id}</Text>
                        <Text> {this.state.user.username}</Text>
                        <Text> {this.state.user.name}</Text>
                        <Text> {this.creationDate()}</Text>
                        <Text> {this.state.user.birthDay}</Text>
                    </RightColumn>
                </UserCase>
                <ButtonContainer>
                    <DistancedButton
                        width="20%"
                        onClick={() => {
                            this.props.onBack();
                        }}
                    >
                        Back
                    </DistancedButton>
                    {localStorage.getItem("id").toString() === this.state.user.id.toString() ?
                        (
                            <DistancedButton
                                width="20%"
                                onClick={() => {
                                    this.props.onEdit()
                                }}
                            >
                                Edit
                            </DistancedButton>
                        ) : null
                    }
                </ButtonContainer>
            </div>
        )}
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
        fetch(`${getDomain()}/users/${this.state.user.id}?token=${localStorage.getItem("token")}`, {
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
        })
    }

    render() {
        return (
            <div>
                <UserCase>
                    <LeftColumnEdit>
                        <Label>Username:</Label>
                        <Label>Birthday:</Label>
                    </LeftColumnEdit>
                    <RightColumn>
                        <InfoChange
                           placeholder = {this.state.user.username}
                           onChange={e => {
                               this.handleInputChange("username", e.target.value);
                           }}
                        />
                        <InfoChange
                            placeholder = {this.state.user.birthDay}
                            onChange={e => {
                                this.handleInputChange("birthday", e.target.value);
                            }}
                        />
                    </RightColumn>
                </UserCase>
                <ButtonContainer>
                    <DistancedButton
                        width="20%"
                        onClick={() => {
                            this.props.onCancel()
                        }}
                    >
                        Cancel
                    </DistancedButton>
                    {localStorage.getItem("id").toString() === this.state.user.id.toString() ?
                        (
                            <DistancedButton
                                width="20%"
                                onClick={() => {
                                    this.sendData();
                                }}
                            >
                                Save
                            </DistancedButton>
                        ):null
                    }
                </ButtonContainer>
            </div>
        )
    }
}

export default withRouter(Profile);