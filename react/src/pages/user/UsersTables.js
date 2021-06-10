import React, {useMemo, useEffect, useState} from 'react';
import { makeRequest } from '../../utility/API';
import { useTable, useGlobalFilter, usePagination } from 'react-table';
import { COLUMNS } from '../../components/table/UserTablesCol';
import TableSearchSpan from '../../components/table/TableSearchSpan';
import { loadJWT } from '../../utility/LocalStorage';
import { Link, useParams } from 'react-router-dom';

const UsersTables = () => {
  const [users, setUsers] = useState([]);
  useEffect(() => {
    makeRequest({
        url: 'admin/users/all',
        successCallback: (data) => {
            const { users } = data;
            setUsers(users);
        },
        failureCallback: (error) => {
            console.log(error);
        },
        requestType: 'GET',
        authorization: loadJWT(),
    });
  }, []);
  const col = useMemo(() => COLUMNS, []);
  const tableInstance = useTable({
    columns: col,
    data: users,
    initialState: { pageSize: 10 }
  }, useGlobalFilter, usePagination)
  const { 
    getTableProps,
    getTableBodyProps,
    headerGroups,
    page,
    nextPage,
    previousPage,
    gotoPage,
    pageCount,
    prepareRow,
    state,
    canPreviousPage,
    canNextPage,
    pageOptions,
    setGlobalFilter,
  } = tableInstance;

  const { globalFilter } = state;
  const { pageIndex } = state;

  return (
    <div className="app-main__outer">
      <div className="app-main__inner">
        <div className="app-page-title">
          <div className="page-title-wrapper">
            <div className="page-title-heading">
              <div className="page-title-icon">
                <i className="pe-7s-drawer icon-gradient bg-happy-itmeo">
                </i>
              </div>
              <div>Account Tables
                <div className="page-title-subheading">Tables are the backbone of almost all web applications.
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-lg-12">
            <div className="main-card mb-3 card">
              <div className="card-body">
                <Link to={`/admin/users/create`}><button className="mb-2 mr-2 btn btn-primary">Add user</button></Link>
                <TableSearchSpan filter={ globalFilter } setFilter={ setGlobalFilter }/>
                <table {...getTableProps()} className="table table-hover table-bordered">
                  <thead> 
                    { 
                      headerGroups.map((headerGroup) => (
                        <tr {...headerGroup.getHeaderGroupProps()}>
                          {headerGroup.headers.map((col) => (
                            <th {...col.getHeaderProps()}>{ col.render("Header") }</th>
                          ))}
                        </tr>
                      )) 
                    }
                  </thead>
                  <tbody {...getTableBodyProps()}>
                    {
                      page.map(row => {
                        prepareRow(row)
                        return (
                          <tr {...row.getRowProps()}>
                            {
                              row.cells.map( cell => {
                                return (
                                <td {...cell.getCellProps()}>{cell.render('Cell')}</td>
                                )
                              })
                            }
                          </tr>
                        )
                      })
                    }
                  </tbody>
                </table>
                <span>
                  Page{' '} { pageIndex + 1 } of { pageOptions.length } {' '}
                </span>
                <span>
                  | Go to page: {' '}
                  <input type="number" defaultValue={pageIndex + 1} 
                    onChange={e => {
                    const pageNumber = e.target.value ? Number(e.target.value) - 1 : 0
                    gotoPage(pageNumber);
                  }} style={{ width: '50px', marginRight: '5px', marginLeft: '5px'}}/>
                </span>
                <div className="btn-group">
                  <button className="mb-2 mr-2 border-0 btn-transition btn btn-outline-primary" onClick={() => gotoPage(0)} disabled={!canPreviousPage}>{'<<'}</button>
                  <button className="mb-2 mr-2 border-0 btn-transition btn btn-outline-primary" disabled={!canPreviousPage} onClick={() => previousPage()}>Previous</button>
                  <button className="mb-2 mr-2 border-0 btn-transition btn btn-outline-primary" disabled={!canNextPage} onClick={() => nextPage()}>Next</button>
                  <button className="mb-2 mr-2 border-0 btn-transition btn btn-outline-primary" onClick={() => gotoPage( pageCount - 1 )} disabled={!canNextPage}>{'>>'}</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="app-wrapper-footer">
        <div className="app-footer">
          <div className="app-footer__inner">
              <div className="app-footer-left">
                  <ul className="nav">
                      <li className="nav-item">
                          <a href="javascript:void(0);" className="nav-link">
                              Footer Link 1
                          </a>
                      </li>
                      <li className="nav-item">
                          <a href="javascript:void(0);" className="nav-link">
                              Footer Link 2
                          </a>
                      </li>
                  </ul>
              </div>
              <div className="app-footer-right">
                  <ul className="nav">
                      <li className="nav-item">
                          <a href="javascript:void(0);" className="nav-link">
                              Footer Link 3
                          </a>
                      </li>
                      <li className="nav-item">
                          <a href="javascript:void(0);" className="nav-link">
                              <div className="badge badge-success mr-1 ml-0">
                                  <small>NEW</small>
                              </div>
                              Footer Link 4
                          </a>
                      </li>
                  </ul>
              </div>
          </div>
        </div>
      </div> 
    </div>
  )
}

export default UsersTables
