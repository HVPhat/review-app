import React, { useState } from 'react';
import * as Yup from 'yup';
import { Form, Formik } from 'formik';
import CustomInput from '../CustomInput';
import { loadJWT } from '../../../utility/LocalStorage';
import { makeRequest } from '../../../utility/API';

const ChangePassForm = ({ id, setShouldRedirect, setErrors }) => {
    const [responseMessage, setResponseMessage] = useState('');

    const submitCallback = (values) => {
        makeRequest({
            url: `admin/users/changepass/${id}`,
            values,
            successCallback: () => {
                setShouldRedirect(true);
            },
            failureCallback: (error) => {
                setErrors(error);
            },
            requestType: "POST",
            authorization: loadJWT(),
        });
    };

    let initialValues = {
        password: '',
        password_confirmation: '',
    };

    const validationSchema = Yup.object({
        password: Yup.string().required('Password is required'),
        password_confirmation: Yup.string()
           .oneOf([Yup.ref('password'), null], 'Passwords must match')
    })

    return (
        <>
            <Formik
                    initialValues={initialValues}
                    enableReinitialize={true}
                    validationSchema={validationSchema}
                    onSubmit={submitCallback}
                >
                    <Form>
                        <div className="form-group">
                            <CustomInput type="password" name={"password"} label={"Password"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <CustomInput type="password" name={"password_confirmation"} label={"Confirm password"} class_name={"form-control"}/>
                        </div>
                        <div className="form-group">
                            <button type='submit' className="mb-2 mr-2 btn btn-primary">Save</button>
                        </div>
                    </Form>
            </Formik>
        </>
    )
}

export default ChangePassForm
