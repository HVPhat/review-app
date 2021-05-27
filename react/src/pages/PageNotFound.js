import React from 'react';
import {Link} from 'react-router-dom';

const PageNotFound = () => {
    return (
        <div className="app-main__outer">
            <div className="app-main__inner">
                <h1>404 - Page Not Found</h1>
                <p>Could not find the page you were looking for.</p>
                <Link to={'/admin/dashboard'}>Return to Dashboard</Link>
            </div>
        </div>
    );
};

export default PageNotFound;