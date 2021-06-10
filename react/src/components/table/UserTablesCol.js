import UserTableCellNavLink from './UserTableCellNavLink';
import React from 'react'

export const COLUMNS = [
    {
        Header: "User Name",
        accessor: "user_name",
        Cell: ({ cell: { value }, row: {original} }) => <UserTableCellNavLink id={original.id} text={value} />
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