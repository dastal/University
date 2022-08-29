import React from "react";
import { Redirect } from "react-router-dom";
import store from "../../../index";

/**
 *
 * Another way to export directly your functional component.
 */
export const RegisterGuard = props => {
    if (!store.getState().userToken) {
        return props.children;
    }
    // if user is already logged in, redirects to the main /app
    return <Redirect to={"/game"} />;
};