import React from "react";
import styled from "styled-components";
import {OnlineState} from "../components/profile/Profile";
import {Button} from "./design/Button";
import store from "../index";
import {Form} from "../components/lobby/Lobby";

const Container = styled.div`
 &:hover {
    background-color: rgba(256,256,256,.05);
  }
  background-color: ${(props => (props.lobbyToken === store.getState().lobbyToken)? "rgba(050,205,050,0.1)" : "none")};
  margin: 6px 0;
  width: 280px;
  padding: 10px;
  border-radius: 6px;
  display: flex;
  align-items: center;
  border: 1px solid #ffffff26;
`;

const UserName = styled.div`
  color: white;
  font-weight: lighter;
  margin-left: 5px;
`;

const Name = styled.div`
  font-weight: bold;
  color: #06c4ff;
  white-space: nowrap;
`;

const NumberOfPlayers = styled.div`
  display: flex;
  justify-content: flex-end;
  width: 100%;
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
const GameMode = styled.div`
  display: flex;
  justify-content: flex-end;
  width: 20%;
  color: goldenrod;
  font-size: 50px;
`;

/**
 * This is an example of a Functional and stateless component (View) in React. Functional components are not classes and thus don't handle internal state changes.
 * Conceptually, components are like JavaScript functions. They accept arbitrary inputs (called “props”) and return React elements describing what should appear on the screen.
 * They are reusable pieces, and think about each piece in isolation.
 * Functional components have to return always something. However, they don't need a "render()" method.
 * https://reactjs.org/docs/components-and-props.html
 * @FunctionalComponent
 */
const LobbyContainer = ({lobby}) => {
  return (
    <Container lobby ={lobby.lobbyName}>
      <Name>{lobby.lobbyName}</Name>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<GameMode>{lobby.mode.charAt(0)}</GameMode><NumberOfPlayers>{lobby.userCount}/4</NumberOfPlayers>
    </Container>
  );
};

export default LobbyContainer;
