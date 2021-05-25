import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Dashboard from '../pages/Dashboard';
import App from '../pages/Dashboard';
import Tables from '../pages/Tables';
import PageNotFound from '../pages/PageNotFound';

const Routes = () => (
    <Switch>
        <Route path="/" exact component={Dashboard} />
        <Route path={"/tables"} component={Tables}/>
        <Route path={'*'} component={PageNotFound}/>
    </Switch>
)
export default Routes