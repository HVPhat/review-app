import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Dashboard from '../pages/dashboard/Dashboard';
import PageNotFound from '../pages/PageNotFound';
import UsersTables from '../pages/user/UsersTables';
import PostTables from '../pages/post/PostTables';
import Login from '../pages/Login';
import { PrivateRoutes } from './PrivateRoutes';

const Routes = () => (
    <Switch>
        <Route path="/admin/login" exact component={Login} />
        <PrivateRoutes path="/admin/dashboard" exact component={Dashboard} />
        <PrivateRoutes path={"/admin/users"} exact component={UsersTables}/>
        <PrivateRoutes path={"/admin/post"} exact component={PostTables}/>
        <Route path={'*'} component={PageNotFound}/>
    </Switch>
)
export default Routes