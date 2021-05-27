import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Dashboard from '../pages/Dashboard';
import App from '../pages/Dashboard';
import PageNotFound from '../pages/PageNotFound';
import UsersTables from '../pages/UsersTables';
import PostTables from '../pages/PostTables'

const Routes = () => (
    <Switch>
        <Route path="/admin/dashboard" exact component={Dashboard} />
        <Route path={"/admin/users"} exact component={UsersTables}/>
        <Route path={"/admin/post"} exact component={PostTables}/>
        <Route path={'*'} component={PageNotFound}/>
    </Switch>
)
export default Routes