import TableCellNavLink from '../UserTableCellNavLink';
import React from 'react'

export const COLUMNS = [
    {
        Header: "Location name",
        accessor: "location_name",
        Cell: ({ cell: { value }, row: {original} }) => <TableCellNavLink id={original.id} text={value} />
    },
    {
        Header: "Open time",
        accessor: "open_time"
    },
    {
        Header: "Closed time",
        accessor: "closed_time"
    },
    {
        Header: "Rating",
        accessor: "rating",
    },
];