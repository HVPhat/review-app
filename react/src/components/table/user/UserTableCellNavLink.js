import React from 'react'
import { Link } from 'react-router-dom'

const UserTableCellNavLink = ({id, text}) => {
    return (
        <div>
            <Link to={'/admin/users/'+id}> {text} </Link>
        </div>
    )
}

export default UserTableCellNavLink
