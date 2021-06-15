import React from 'react';
import { Link, useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { makeRequest } from '../../utility/API';
import { Redirect } from 'react-router-dom';
import { loadJWT } from '../../utility/LocalStorage';

const ShowUser = () => {
    // get id from th url 
    let { id } = useParams();
    const [user, setUser] = useState([]);
    const [shouldRedirect, setShouldRedirect] = useState(false);
    useEffect(() => {
        makeRequest({
            url: `admin/users/show/${id}`,
            successCallback: (data) => {
                const { user_data } = data;
                setUser(user_data);
            },
            failureCallback: (error) => {
                console.log(error);
            },
            requestType: 'GET',
            authorization: loadJWT(),
        });
    }, []);

    const deleteUser = (id) => {
        makeRequest({
            url: `admin/users/delete/${id}`,
            successCallback: (data) => {
                setShouldRedirect(true);
            },
            failureCallback: (error) => {
                console.log(error);
            },
            requestType: 'DELETE',
            authorization: loadJWT(),
        });
    };
    const lockUser = (id) => {
        makeRequest({
            url: `admin/users/lock/${id}`,
            successCallback: (data) => {
                setShouldRedirect(true);
            },
            failureCallback: (error) => {
                console.log(error);
            },
            requestType: 'POST',
            authorization: loadJWT(),
        });
    };
    return shouldRedirect ? ( <Redirect to='/admin/users' /> ) : (
    <>
        <div className="app-main__outer">
          <div className="app-main__inner">
            <div className="app-page-title">
              <div className="page-title-wrapper">
                <div className="page-title-heading">
                  <div className="page-title-icon">
                    <i className="pe-7s-drawer icon-gradient bg-happy-itmeo">
                    </i>
                  </div>
                  <div>Account detail
                      <div className="page-title-subheading">
                  </div>
                </div>
               </div>
              </div>
            </div>            
            <div className="row">
              <div className="col-lg-12">
                <div className="main-card mb-3 card">
                  <div className="card-body">
                      <div className="row">
                        <div className="col-md-9">
                          <div className="form-group">
	    		          	<label>First name</label>
	    		          	<input type="text" className="form-control" value={user.first_name} readOnly />
	    		          </div>
	    		          <div className="form-group">
	    		          	<label>Last name</label>
	    		          	<input type="text" className="form-control" value={user.last_name} readOnly />
	    		          </div>
	    		          <div className="form-group">
	    		          	<label>User name</label>
	    		          	<input type="text" className="form-control" value={user.user_name} readOnly />
	    		          </div>
                        </div>
                        <div className="col-md-3">
                            <img src={user.avatar} style={{ width: "250px", height: "250px", }}alt="avata" className="img-thumbnail" />
                        </div>
                      </div>
	    		      <div className="form-group">
	    		      	<label>Gender</label>
	    		      	<input type="text" className="form-control" value={user.gender} readOnly />
	    		      </div>
	    		      <div className="form-group">
	    		      	<label>Birthday</label>
	    		      	<input type="text" className="form-control" value={user.birthday} readOnly />
	    		      </div>
	    		      <div className="form-group">
	    		      	<label>Rank</label>
	    		      	<input type="text" className="form-control" value={user.rank} readOnly />
	    		      </div>
	    		      <div className="form-group">
                          <Link to={`/admin/users/edit/${user.id}`}> <button className="mb-2 mr-2 btn-transition btn btn-outline-primary">Edit</button> </Link>
                          <Link to={`/admin/users/changepass/${user.id}`}> <button className="mb-2 mr-2 btn-transition btn btn-outline-info">Change Password</button> </Link>
                          <button className="mb-2 mr-2 btn-transition btn btn-outline-warning" onClick={() => {lockUser(user.id)}}>{user.is_locked == 1 ? "Unlock" : "Lock"}</button>
                          <button className="mb-2 mr-2 btn-transition btn btn-outline-danger" onClick={() => {deleteUser(user.id)}}>Delete</button>
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
    </>
    )
}

export default ShowUser
