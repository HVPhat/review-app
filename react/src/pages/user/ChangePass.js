import React from 'react';
import ChangePassForm from '../../components/form/user/ChangePassForm';
import FailureAlert from '../../components/alert/FailureAlert';
import { useParams, Redirect } from 'react-router-dom';
import { useState, useEffect } from 'react';
import { makeRequest } from '../../utility/API';
import { loadJWT } from '../../utility/LocalStorage';

const ChangePass = () => {
    const { id } = useParams();
    const [shouldRedirect, setShouldRedirect] = useState(false);
    const [errors, setErrors] = useState(null);
    const [user, setUser] = useState([]);

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
    },[]);

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
                  <div>Change Password
                      <div className="page-title-subheading">
                  </div>
                </div>
               </div>
              </div>
            </div>            
            <div className="row">
              <div className="col-lg-12">
                <div className="main-card mb-3 card">
                  {errors && <FailureAlert errors={errors}/>}
                  <div className="card-body">
                      <ChangePassForm id={id} setErrors={setErrors} setShouldRedirect={setShouldRedirect} />
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

export default ChangePass
