import TableCellNavLink from './TableCellNavLink';
import React from 'react'
import { useRowSelect } from 'react-table';
export const COLUMNS = [
    {
        Header: "User Name",
        accessor: "user_name",
        Cell: ({ cell: { value }, row: {original} }) => <TableCellNavLink id={original.id} text={value} />
    },
    {
        Header: "Gender",
        accessor: "gender"
    },
    {
        Header: "Email",
        accessor: "email"
    },
    {
        Header: "Rank",
        accessor: "rank",
    }
]