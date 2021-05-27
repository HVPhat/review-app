import React from 'react'
import {BrowserRouter} from 'react-router-dom';
import Routes from './routing/Routes';
import Tables from './pages/UsersTables';
import Header from './layout/Header';
import Sidebar from './layout/Sidebar';

const App = () => {
    return (
        <>
            <div className="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
                <Header />
                <div className="app-main">
                    <BrowserRouter>
                        <Sidebar />
                        <Routes />
                    </BrowserRouter>
                </div>
            </div>
        </>
    )
}

export default App
