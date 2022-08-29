import React from "react";
import { BrowserRouter, Redirect, Route, Switch } from "react-router-dom";
import { GameGuard } from "../routeProtectors/GameGuard";
import GameRouter from "./GameRouter";
import { LoginGuard } from "../routeProtectors/LoginGuard";
import Login from "../../login/Login";
import Register from "../../register/Register"
import {RegisterGuard} from "../routeProtectors/RegisterGuard";
import {UnityGuard} from "../routeProtectors/UnityGuard";
import {LobbyGuard} from "../routeProtectors/LobbyGuard";
import UsersRouter from "./UsersRouter";
import Profile from "../../profile/Profile";
import Lobby from "../../lobby/Lobby";
import UnityGame from "../../unity/Unity";
import Header from "../../../views/Header";

/**
 * Main router of your application.
 * In the following class, different routes are rendered. In our case, there is a Login Route with matches the path "/login"
 * and another Router that matches the route "/game".
 * The main difference between these two routes is the following:
 * /login renders another component without any sub-route
 * /game renders a Router that contains other sub-routes that render in turn other react components
 * Documentation about routing in React: https://reacttraining.com/react-router/web/guides/quick-start
 */
class AppRouter extends React.Component {
  render() {
    return (
      <BrowserRouter>
        <Switch>
          <div>
            <Route
              path="/game"
              render={() => (
                <div>
                  <Header height={"100"} />
                  <GameGuard>
                    <GameRouter base={"/game"} />
                  </GameGuard>
                </div>
              )}
            />
            <Route
              path="/login"
              exact
              render={() => (
                <div>
                  <Header height={"100"} />
                  <LoginGuard>
                    <Login />
                  </LoginGuard>
                </div>
              )}
            />
              <Route
                path="/register"
                exact
                render={() => (
                  <div>
                    <Header height={"100"} />
                    <RegisterGuard>
                      <Register />
                    </RegisterGuard>
                  </div>
                )}
              />
              <Route
                path="/unity"
                exact
                render={() => (
                  <UnityGuard>
                    <UnityGame />
                  </UnityGuard>
                )}
              />
              <Route
                path="/lobby"
                exact
                render={() => (
                  <div>
                    <Header height={"100"} />
                    <LobbyGuard>
                      <Lobby />
                    </LobbyGuard>
                  </div>
                )}
              />
              <Route
                exact
                path="/users/:id"
                component={Profile}
              />
              <Route path="/users" exact render={() => <Redirect to={"/game"} />} />

              <Route path="/" exact render={() => <Redirect to={"/game"} />} />


          </div>
        </Switch>
      </BrowserRouter>
    );
  }
}

/*
* Don't forget to export your component!
 */
export default AppRouter;
