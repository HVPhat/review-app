import PostTableCellNavLink from './PostTableCellNavLink';
import React from 'react'

export const COLUMNS = [
    {
        Header: "Post title",
        accessor: "title",
        Cell: ({ cell: { value }, row: {original} }) => <PostTableCellNavLink id={original.id} text={value} />
    },
    {
        Header: "Location",
        accessor: "location"
    },
    {
        Header: "View quantity",
        accessor: "view_quantity"
    },
    {
        Header: "Like quantity",
        accessor: "like_quantity",
    }
]