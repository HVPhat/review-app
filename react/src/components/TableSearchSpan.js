import React from 'react'

const TableSearchSpan = ({ filter, setFilter }) => {
    return (
        <span className="float-right card-title">
            Search: {' '}
            <input value={filter || ''} onChange={(e) => setFilter(e.target.value)} />
        </span>
    )
}

export default TableSearchSpan
