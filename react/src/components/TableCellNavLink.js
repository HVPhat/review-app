import React from 'react'
import { Link } from 'react-router-dom'

const TableCellNavLink = ({id, text}) => {
    return (
        <div>
            <Link to={'/admin/users/'+id}> {text} </Link>
        </div>
    )
}

export default TableCellNavLink
