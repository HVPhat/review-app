import React, {useMemo, useEffect, useState} from 'react'
import { makeRequest } from '../../utility/API'
import { useTable } from 'react-table'
import { COLUMNS } from '../../components/table/post/PostTableCol'
import { loadJWT } from '../../utility/LocalStorage';

const PostTables = () => {
  const [posts, setPost] = useState([]);
  useEffect(() => {
    makeRequest({
        url: 'admin/posts/all',
        successCallback: (data) => {
            const { posts } = data;
            setPost(posts);
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
    data: posts,
  })
  const { 
    getTableProps,
    getTableBodyProps,
    headerGroups,
    rows,
    prepareRow,
  } = tableInstance;

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
              <div>Post Tables
                <div className="page-title-subheading">Tables are the backbone of almost all web applications.
                </div>
              </div>
            </div>
            <div className="page-title-actions">
              <button type="button" data-toggle="tooltip" title="Example Tooltip" data-placement="bottom" className="btn-shadow mr-3 btn btn-dark">
                <i className="fa fa-star" />
              </button>
            </div>
          </div>
        </div>            
        <div className="row">
          <div className="col-lg-12">
            <div className="main-card mb-3 card">
              <div className="card-body"><h5 className="card-title">Account table</h5>
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
                      rows.map(row => {
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
                  <tfoot>

                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>    
    </div>

  )
}

export default PostTables
