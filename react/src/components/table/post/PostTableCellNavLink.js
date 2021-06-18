import React from 'react'
import { Link } from 'react-router-dom'

const PostTableCellNavLink = ({id, text}) => {
    return (
        <div>
            <Link to={'/admin/posts/'+id}> {text} </Link>
        </div>
    )
}

export default PostTableCellNavLink
