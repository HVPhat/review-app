import React from 'react';
import {ErrorMessage, Field} from 'formik';

const getErrorDiv = message => {
    return (
        <div style={{color: '#dc3545'}}>
            {message}
        </div>
    );
};
const CustomInput = ({class_name, name, label, type = 'text'}) => {
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
                            className={class_name}/>
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

export default CustomInput;