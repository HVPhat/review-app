import React from 'react'

const Tables = () => {
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
          <div>Regular Tables
            <div className="page-title-subheading">Tables are the backbone of almost all web applications.
            </div>
          </div>
        </div>
        <div className="page-title-actions">
          <button type="button" data-toggle="tooltip" title="Example Tooltip" data-placement="bottom" className="btn-shadow mr-3 btn btn-dark">
            <i className="fa fa-star" />
          </button>
          <div className="d-inline-block dropdown">
            <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" className="btn-shadow dropdown-toggle btn btn-info">
              <span className="btn-icon-wrapper pr-2 opacity-7">
                <i className="fa fa-business-time fa-w-20" />
              </span>
              Buttons
            </button>
            <div tabIndex={-1} role="menu" aria-hidden="true" className="dropdown-menu dropdown-menu-right">
              <ul className="nav flex-column">
                <li className="nav-item">
                  <a href="javascript:void(0);" className="nav-link">
                    <i className="nav-link-icon lnr-inbox" />
                    <span>
                      Inbox
                    </span>
                    <div className="ml-auto badge badge-pill badge-secondary">86</div>
                  </a>
                </li>
                <li className="nav-item">
                  <a href="javascript:void(0);" className="nav-link">
                    <i className="nav-link-icon lnr-book" />
                    <span>
                      Book
                    </span>
                    <div className="ml-auto badge badge-pill badge-danger">5</div>
                  </a>
                </li>
                <li className="nav-item">
                  <a href="javascript:void(0);" className="nav-link">
                    <i className="nav-link-icon lnr-picture" />
                    <span>
                      Picture
                    </span>
                  </a>
                </li>
                <li className="nav-item">
                  <a disabled href="javascript:void(0);" className="nav-link disabled">
                    <i className="nav-link-icon lnr-file-empty" />
                    <span>
                      File Disabled
                    </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>  </div>
    </div>            <div className="row">
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Simple table</h5>
            <table className="mb-0 table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table bordered</h5>
            <table className="mb-0 table table-bordered">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table without border</h5>
            <table className="mb-0 table table-borderless">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table dark</h5>
            <table className="mb-0 table table-dark">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table with hover</h5>
            <table className="mb-0 table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table responsive</h5>
            <div className="table-responsive">
              <table className="mb-0 table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Table heading</th>
                    <th>Table heading</th>
                    <th>Table heading</th>
                    <th>Table heading</th>
                    <th>Table heading</th>
                    <th>Table heading</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                    <td>Table cell</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table sizing</h5>
            <table className="mb-0 table table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div className="col-lg-6">
        <div className="main-card mb-3 card">
          <div className="card-body"><h5 className="card-title">Table striped</h5>
            <table className="mb-0 table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                  <td>Larry</td>
                  <td>the Bird</td>
                  <td>@twitter</td>
                </tr>
              </tbody>
            </table>
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
        </div>
    </div>
  </div>    
</div>

    )
}

export default Tables
