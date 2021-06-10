import React, { useState } from 'react';
import * as Yup from 'yup';
import { Field, Form, Formik } from 'formik';
import CustomInput from './CustomInput';
import CustomInputFiles from './CustomInputFiles';
import { loadJWT } from '../../utility/LocalStorage';
import { makeRequest } from '../../utility/API';

const BaseUserForm = ({ user, setShouldRedirect, setErrors }) => {
    const [responseMessage, setResponseMessage] = useState('');

    let initialValues = {
        first_name: user?.first_name || '',
        last_name: user?.last_name || '',
        email: user?.email || '',
        user_name: user?.user_name || '',
        gender: user?.gender || '',
        birthday: user?.birthday || '',
        exp_point: user?.exp_point || '',
        rank: user?.rank || '',
    };

    const submitCallback = (values) => {
        makeRequest({
            url: `admin/users/${user ? `update/${user.id}` : 'add'}`,
            values,
            successCallback: () => {
            },
            failureCallback: (error) => {
                setErrors(error);
            },
            requestType: "POST",
            authorization: loadJWT(),
        });
    };

    const validationSchema = user == null ? Yup.object({
        first_name: Yup.string().required('First name is required'),
        last_name: Yup.string().required('Last name is required'),
        email: Yup.string()
                  .email("Invalid email address")
                  .required("Email address is required")
                  .min(6, 'Email must be at least 6 characters')
                  .max(50, 'Email cannot exceed 50 characters'),
        user_name: Yup.string().required("User name is required"),
        birthday: Yup.string().required('Birthday is required'),
        exp_point: Yup.number().required('Exp point is required'),
        rank: Yup.number().required('Rank is required'),
        password: Yup.string().required('Password is required'),
        password_confirmation: Yup.string()
           .oneOf([Yup.ref('password'), null], 'Passwords must match')
    }) 
    : 
    Yup.object({
        first_name: Yup.string().required('First name is required'),
        last_name: Yup.string().required('Last name is required'),
        email: Yup.string()
                  .email("Invalid email address")
                  .required("Email address is required")
                  .min(6, 'Email must be at least 6 characters')
                  .max(50, 'Email cannot exceed 50 characters'),
        user_name: Yup.string().required("User name is required"),
        birthday: Yup.string().required('Birthday is required'),
        exp_point: Yup.number().required('Exp point is required'),
        rank: Yup.number().required('Rank is required'),
    });

    return user == null ? (
        
        <>
            <Formik
                    initialValues={initialValues}
                    enableReinitialize={true}
                    validationSchema={validationSchema}
                    onSubmit={submitCallback}
                >
                    <Form>
                        <div className="form-group">
                            <CustomInput name={"first_name"} label={"First name"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"last_name"} label={"Last name"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                        <label>Gender</label>
                        <Field as="select" className="form-control" name="gender">
                            <option value="Female">Female</option>
                            <option value="Male">Male</option>
                        </Field>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"email"} label={"Email"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"user_name"} label={"User name"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput type="password" name={"password"} label={"Password"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput type="password" name={"password_confirmation"} label={"Confirm password"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"birthday"} label={"Birthday"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"exp_point"} label={"Exp point"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"rank"} label={"Rank"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <button type='submit' className="mb-2 mr-2 btn btn-primary">Save</button>
                        </div>
                    </Form>
            </Formik>
        </>
    ) : (
        <>
            <Formik
                    initialValues={initialValues}
                    enableReinitialize={true}
                    validationSchema={validationSchema}
                    onSubmit={submitCallback}
                >
                    <Form>
                        <div className="row">
                    <div className="col-md-9">
                        <div className="form-group">
                            <CustomInput name={"first_name"} label={"First name"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"last_name"} label={"Last name"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"user_name"} label={"User name"} class_name={"form-control"}/>
                        </div>
                    </div>
                    <div className="col-md-3">
                        <img src={user.avatar} style={{ width: "250px", height: "250px", }} className="img-thumbnail" />
                        <CustomInputFiles name={"avatar"} label={"Avatar"} class_name={"form-control"} />
                    </div>
                    </div>
                        <div className="form-group">
                        <label>Gender</label>
                        <Field as="select" className="form-control" name="gender">
                            <option value="Female">Female</option>
                            <option value="Male">Male</option>
                        </Field>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"email"} label={"Email"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"birthday"} label={"Birthday"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"exp_point"} label={"Exp point"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput name={"rank"} label={"Rank"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <button type='submit' className="mb-2 mr-2 btn btn-primary">Save</button>
                        </div>
                    </Form>
            </Formik>
        </>
    )
}

export default BaseUserForm
