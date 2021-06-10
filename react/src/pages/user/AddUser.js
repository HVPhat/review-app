import React from 'react';
import BaseUserForm from '../../components/form/BaseUserForm';
import { useParams, Redirect } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { makeRequest } from '../../utility/API';
import { loadJWT } from '../../utility/LocalStorage';
import FailureAlert from '../../components/alert/FailureAlert';

const AddUser = () => {
    const [shouldRedirect, setShouldRedirect] = useState(false);
    const [errors, setErrors] = useState(null);

    
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
                  <div>Add account
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
                      <BaseUserForm user={null} setErrors={setErrors} setShouldRedirect={setShouldRedirect} />
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

export default AddUser
