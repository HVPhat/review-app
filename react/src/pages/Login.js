import React from 'react';
import {Form, Formik} from 'formik';
import * as Yup from 'yup';
import { makeRequest } from '../utility/API';
import { useState } from 'react';
import CustomInput from '../components/form/CustomInput';
import {saveJWT, saveUser} from '../utility/LocalStorage';
import { Route, Redirect } from 'react-router-dom';
import FailureAlert from '../components/alert/FailureAlert';

const Login = ({setIsAuthenticated}) => {
    const initialValues = {
        email: '',
        password: '',
    };
    const [errors, setErrors] = useState(null);

    const successfulAuthenticationCallback = (data) => {
        const {user, access_token} = data;
        saveUser(user);
        saveJWT(access_token);
    };

    const submitCallback = (values) => {
        makeRequest({
            url: `/admin/login`,
            values,
            successCallback: (data) => {
                setIsAuthenticated();
                successfulAuthenticationCallback(data);
            },
            failureCallback: (errorResponse) => {
                setErrors(errorResponse)
            }
        });
    };

    const validationSchema = Yup.object({
        email: Yup.string()
            .email('Invalid email address')
            .min(6, 'Email must be at least 6 characters')
            .max(50, 'Email cannot exceed 50 characters')
            .required('Email address is required'),
        password: Yup.string()
            .min(8, 'Password must be at least 8 characters')
            .required('Password is required')
    });

    return (
        <div className="tab-content">
            <div className="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
                <div className="main-card mb-3 card">
                    {errors && <FailureAlert errors={errors}/>}
                    <div className="card-body">
                        <Formik
                            initialValues={initialValues}
                            validationSchema={validationSchema}
                            onSubmit={submitCallback}>
                            <Form>
                                    <div className="col-md-6">
                                        <div className="position-relative form-group">
                                            <CustomInput class_name="form-control" name={'email'} label={'Email'} />
                                        </div>
                                    </div>
                                    <div className="col-md-6">
                                        <div className="position-relative form-group">
                                        <CustomInput type="password" class_name="form-control" name={'password'} label={'Password'} />
                                        </div>
                                    </div>
                                <button className="mt-2 btn btn-primary" type="submit">Login</button>
                            </Form>
                        </Formik>
                    </div>
                </div>
            </div>
        </div>
    );
};
export default Login;