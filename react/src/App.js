import React from 'react'
import {BrowserRouter} from 'react-router-dom';
import Routes from './routing/Routes';
import Header from './layout/Header';
import Sidebar from './layout/Sidebar';
import Footer from './layout/Footer';
import {clearState, loadJWT, loadUser} from './utility/LocalStorage';
import { useState } from 'react';
import Login from './pages/Login';
import { Redirect } from 'react-router-dom';

const App = () => {
    const [user, setUser] = useState([])
    const [isAuthenticated, setIsAuthenticated] = useState(!!loadJWT());
    const onLogin = () => {
        setIsAuthenticated(true);
    };
    const onLogout = () => {
        clearState();
        setIsAuthenticated(false);
    };
    return (
        !isAuthenticated ?
        <Login setIsAuthenticated={onLogin} />
        :
        <>
            <div className="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
                <BrowserRouter>
                    <Header logout={onLogout} />
                        <div className="app-main">
                            <Sidebar />
                            <Routes />
                        </div>
                </BrowserRouter>
            </div>
        </>
    )
}

export default App
