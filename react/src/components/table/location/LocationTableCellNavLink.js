import React from 'react';
import { Link } from 'react-router-dom';

const LocationTableCellNAvLink = ({id, text}) => {
    return (
        <div>
            <Link to={'/admin/location/'+id}> {text} </Link>
        </div>
    )
}

export default LocationTableCellNAvLink
