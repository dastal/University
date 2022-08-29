import React from "react";
import styled from "styled-components";
import {BaseContainer} from "../../helpers/layout";
import {getDomain} from "../../helpers/getDomain";
import User from "../shared/models/incomingMessages/User";
import {withRouter} from "react-router-dom";
import {Button} from "../../views/design/Button";
import { connect } from "react-redux";
import * as actionCreator from "../../store/actions/actions";

export const FormContainer = styled.div`
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
  margin: 2px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 60%;
  height: 375px;
  font-size: 16px;
  font-weight: 300;
  padding-left: 37px;
  padding-right: 37px;
  border-radius: 5px;
  border: darkkhaki;
  background: linear-gradient(rgb(20,20,20, 0.3), rgb(20,20,20, 0.3));
  transition: opacity 0.5s ease, transform 0.5s ease;
`;

const InputField = styled.input`
  &::placeholder {
    color: rgba(255, 255, 255, 0.2);
  }
  height: 35px;
  padding-left: 15px;
  margin-left: -4px;
  border: ${props => (props.invalid ? "#b22222 solid 2px" : "none")};
  border-radius: 20px;
  margin-bottom: 20px;
  background: rgba(255, 255, 255, 0.2);
  color: white;
  width: ${props => (props.width ? props.width : "auto")};
`;

export const Label = styled.label`
  color: white;
  margin-bottom: 10px;
  text-transform: uppercase;
`;

export const ButtonContainer = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 20px;
`;

const ErrorLabel = styled.label`
  color: red;
  margin-bottom: 10px;
  display: ${props => (props.display)};
`;

/**
 * Classes in React allow you to have an internal state within the class and to have the React life-cycle for your component.
 * You should have a class (instead of a functional component) when:
 * - You need an internal state that cannot be achieved via props from other parent components
 * - You fetch data from the server (e.g., in componentDidMount())
 * - You want to access the DOM via Refs
 * https://reactjs.org/docs/react-component.html
 * @Class
 */
class Login extends React.Component {
    /**
     * If you don’t initialize the state and you don’t bind methods, you don’t need to implement a constructor for your React component.
     * The constructor for a React component is called before it is mounted (rendered).
     * In this case the initial state is defined in the constructor. The state is a JS object containing two fields: name and username
     * These fields are then handled in the onChange() methods in the resp. InputFields
     */
    constructor(props) {
        super(props);
        this.state = {
            password: null,
            username: null,
            requestValid: true,
        };
    }

    /**
     * HTTP POST request is sent to the backend.
     * If the request is successful, a new user is returned to the front-end and its token is stored in the localStorage.
     */
    login() {
        let status;
        fetch(`${getDomain()}/users/login`, {
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            method: "POST",
            body: JSON.stringify({username: this.state.username.toLowerCase(), password: this.state.password})
        })
            .then(response => {
                status = response.status;
                return response.json();
            })
            .then(jsonResponse => {
                if (status === 404 || status === 401) {
                    this.setState({"requestValid": false});
                    return;
                } else if (status !== 200) throw new Error();
                this.setState({"requestValid": true});
                // store id/token/username in redux store
                this.props.setUserId(jsonResponse.id);
                this.props.setUserToken(jsonResponse.token);
                this.props.setUsername(this.state.username);
                // store the token into the local storage
                //localStorage.setItem("token", jsonResponse.token);
                //localStorage.setItem("id", jsonResponse.id);
                // user login successfully worked --> navigate to the route /game in the GameRouter
                this.props.history.push(`/game`);
            })
            .catch(err => {
                if (err.message.match(/Failed to fetch/)) {
                    alert("The server cannot be reached. Did you start it?");
                } else {
                    alert(`Something went wrong during the login: ${err.message}`);
                }
            })
    }

    signUp() {
        this.props.history.push(`/register`)
    }

    /**
     *  Every time the user enters something in the input field, the state gets updated.
     * @param key (the key of the state for identifying the field that needs to be updated)
     * @param value (the value that gets assigned to the identified state key)
     */
    handleInputChange(key, value) {
        // Example: if the key is username, this statement is the equivalent to the following one:
        // this.setState({'username': value});
        this.setState({[key]: value});
    }

    /**
     * componentDidMount() is invoked immediately after a component is mounted (inserted into the tree).
     * Initialization that requires DOM nodes should go here.
     * If you need to load data from a remote endpoint, this is a good place to instantiate the network request.
     * You may call setState() immediately in componentDidMount().
     * It will trigger an extra rendering, but it will happen before the browser updates the screen.
     */
    componentDidMount() {
    }

    render() {
        return (
            <BaseContainer>
                <FormContainer>
                    <Form>
                        <Label>Username</Label>
                        <InputField
                            placeholder="Enter here.."
                            onChange={e => {
                                this.handleInputChange("username", e.target.value);
                            }}
                        />
                        <Label>Password</Label>
                        <InputField type="password"
                                    placeholder="Enter here.."
                                    onChange={e => {
                                        this.handleInputChange("password", e.target.value);
                                    }}
                                    onKeyPress={event => {
                                        if (!this.state.username || !this.state.password) return;
                                        if (event.key === 'Enter') {
                                            this.login();
                                        }
                                    }}
                        />
                        <ErrorLabel display={this.state.requestValid ? "none" : ""}>Incorrect username or
                            password.</ErrorLabel>
                        <ButtonContainer>
                            <Button
                                disabled={!this.state.username || !this.state.password}
                                width="50%"
                                onClick={() => {
                                    this.login();
                                }}
                            >
                                Login
                            </Button>
                            <Button
                                width="20%"
                                onClick={() => {
                                    this.signUp();
                                }}
                            >
                                Sign Up
                            </Button>
                        </ButtonContainer>
                    </Form>
                </FormContainer>
            </BaseContainer>
        );
    }
}

const mapStateToProps = state =>{
    return {
        userToken: state.userToken,
    }
};

const mapDispatchToProps = dispatch => {
    return {
        setUserId: (id) => dispatch(actionCreator.setUserId(id)),
        setUsername: (username) => dispatch(actionCreator.setUsername(username)),
        setUserToken: (token) => dispatch(actionCreator.setUserToken(token)),
    }
};
/**
 * You can get access to the history object's properties via the withRouter.
 * withRouter will pass updated match, location, and history props to the wrapped component whenever it renders.
 */
export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Login));
