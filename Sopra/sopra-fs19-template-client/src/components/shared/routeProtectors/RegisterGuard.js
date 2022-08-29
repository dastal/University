import React from "react";
import { Redirect} from "react-router-dom";

/**
 *
 * Another way to export directly your functional component.
 */

export const RegisterGuard = props => {
    if(!localStorage.getItem("token")) {
        return props.children;
    }
    // if the user is already logged in, this redirects to the main /app
    return <Redirect to={"/game"}/>;
};