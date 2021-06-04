import React from 'react';
import { Route, Redirect } from 'react-router-dom';

function PrivateRoutes({ component: Component, roles, ...rest }) {
    return (
        <Route {...rest} render={props => {
            if (!sessionStorage.getItem('user')) {
                // not logged in so redirect to login page with the return url
                return <Redirect to={{ pathname: '/admin/login', state: { from: props.location } }} />
            }

            // logged in so return component
            return <Component {...props} />
        }} />
    );
}

export { PrivateRoutes };