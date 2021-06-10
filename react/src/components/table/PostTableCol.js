import TableCellNavLink from './UserTableCellNavLink';
import React from 'react'

export const COLUMNS = [
    {
        Header: "Post title",
        accessor: "title",
        Cell: ({ cell: { value }, row: {original} }) => <TableCellNavLink id={original.id} text={value} />
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