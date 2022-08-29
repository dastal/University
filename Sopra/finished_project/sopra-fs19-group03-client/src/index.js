import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";

import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import reducer from './store/reducers/reducer';
import thunk from "redux-thunk"
import { composeWithDevTools } from "redux-devtools-extension";
import throttle from 'lodash/throttle';

const loadState = () => {
    try {
        const serializedState = sessionStorage.getItem('state');
        if(serializedState === null) {
            return undefined;
        }
        return JSON.parse(serializedState);
    } catch (e) {
        return undefined;
    }
};

const saveState = (state) => {
    try {
        const serializedState = JSON.stringify(state);
        sessionStorage.setItem('state', serializedState);
    } catch (e) {
        // Ignore write errors;
    }
};

const persistedState = loadState();

const store = createStore(
    reducer,
    persistedState,
    composeWithDevTools(applyMiddleware(thunk)),
);

store.subscribe(throttle(() => {
    saveState(store.getState());
}, 1000));

export default store;
/**
 * This is the entry point of your React application where the root element is in the public/index.html.
 * We call this a “root” DOM node because everything inside it will be managed by React DOM.
 * Applications built with just React usually have a single root DOM node.
 * More: https://reactjs.org/docs/rendering-elements.html
 */
ReactDOM.render(<Provider store={store}><App /></Provider>, document.getElementById("root"));
