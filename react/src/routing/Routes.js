import React from 'react';
import {Route, Switch} from 'react-router-dom';
import Dashboard from '../pages/dashboard/Dashboard';
import PageNotFound from '../pages/PageNotFound';
import UsersTables from '../pages/user/UsersTables';
import ShowUser from '../pages/user/ShowUser';
import ChangePass from '../pages/user/ChangePass';
import PostTables from '../pages/post/PostTables';
import Login from '../pages/Login';
import { PrivateRoutes } from './PrivateRoutes';
import EditUser from '../pages/user/EditUser';
import AddUser from '../pages/user/AddUser';
import LocationTable from '../pages/location/LocationTable';

const Routes = () => (
    <Switch>
        <Route path="/admin/login" exact component={Login} />
        <PrivateRoutes path="/admin/dashboard" exact component={Dashboard} />
        <PrivateRoutes path={"/admin/users"} exact component={UsersTables}/>
        <PrivateRoutes path={"/admin/users/edit/:id"} exact component={EditUser}/>
        <PrivateRoutes path={"/admin/users/create"} exact component={AddUser}/>
        <PrivateRoutes path={"/admin/users/:id"} exact component={ShowUser}/>
        <PrivateRoutes path={"/admin/users/changepass/:id"} exact component={ChangePass}/>
        
        <PrivateRoutes path={"/admin/posts"} exact component={PostTables}/>

        <PrivateRoutes path={"/admin/location"} exact component={LocationTable} />
        <Route path={'*'} component={PageNotFound}/>
    </Switch>
)
export default Routes