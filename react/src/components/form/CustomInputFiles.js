import React from 'react';
import {ErrorMessage, Field} from 'formik';

const getErrorDiv = message => {
    return (
        <div style={{color: '#dc3545'}}>
            {message}
        </div>
    );
};
const CustomInputFiles = ({ class_name, name, label, type = 'file' }) => {
    return (
        <>
            <label htmlFor={name}>{label}</label>
            <Field name={name}>
                {({field}) => {
                    return (<>
                        <input
                            type={type}
                            {...field}
                            placeholder={label} 
                            className={class_name}
                            onChange={(event) => {
                                console.log(event.currentTarget.files[0]);
                                setFieldValue(name, event.currentTarget.files[0]);
                            }}
                            />
                        <ErrorMessage
                            name={name}
                            render={getErrorDiv}
                        />
                    </>)
                }}
            </Field>
        </>
    );
};

export default CustomInputFiles;