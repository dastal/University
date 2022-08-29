import React from "react";
import styled from "styled-components";
import {OnlineState} from "../components/profile/Profile";
import {Button} from "./design/Button";
import Lobby from  "../components/lobby/Lobby";
import {withRouter} from "react-router-dom";
import store from "../index";

const Container = styled.div`
 &:hover {
    background-color: rgba(256,256,256,.05);
  }
  background-color: ${(props => (props.id === store.getState().myUserId)? "rgba(050,205,050,0.1)" : "none")};
  margin: 6px 0;
  width: 280px;
  padding: 10px;
  border-radius: 6px;
  display: flex;
  align-items: center;
  border: 1px solid #ffffff26;
`;

const GameMode = styled.div`
  display: flex;
  justify-content: flex-end;
  width: 20%;
  color: limegreen;
  font-size: 20px;
`;

const UserName = styled.div`
  color: #06c4ff;
  font-weight: lighter;
  margin-left: 5px;
`;

const Name = styled.div`
  font-weight: bold;
  color: #06c4ff;
  white-space: nowrap;
`;

const Id = styled.div`
  margin-left: auto;
  margin-right: 10px;
  font-weight: bold;
`;

const OnlineStateContainer = styled.div`
  display: flex;
  justify-content: flex-end;
  width: 100%;
`;

/**
 * This is an example of a Functional and stateless component (View) in React. Functional components are not classes and thus don't handle internal state changes.
 * Conceptually, components are like JavaScript functions. They accept arbitrary inputs (called “props”) and return React elements describing what should appear on the screen.
 * They are reusable pieces, and think about each piece in isolation.
 * Functional components have to return always something. However, they don't need a "render()" method.
 * https://reactjs.org/docs/components-and-props.html
 * @FunctionalComponent
 */


class GamePlayer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: null,
        };
    }




    ready(){
  }

    render() {
        return (
            <Container id={this.props.user.id}>
                <UserName>{this.props.user.username}</UserName>



                <OnlineStateContainer>

                    {this.props.user.username === (store.getState().username) && !this.props.readyUsers.includes(this.props.user.id)?
                        (

                            <Button

                                disabled = {this.props.lobby < 2}
                                onClick={() => {
                                    this.ready();
                                    this.props.Lobby.ready(this.props.user.id);
                                }}
                            >

                                Ready
                            </Button>


                        ) : null}



                </OnlineStateContainer>
                {this.props.readyUsers.includes(this.props.user.id)?
                    (

                        <GameMode>
                            READY!
                        </GameMode>

                    ) : null}
            </Container>
        )
    }
}

export default withRouter(GamePlayer);
