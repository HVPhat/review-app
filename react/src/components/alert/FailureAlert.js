import React from 'react';

const FailureAlert = ({errors}) => {
    return (
        <div className='alert alert-danger'>
            <ul className='plainList'>
                {Object.values(errors).map((error, index) => {
                    return <li key={index}>{error}</li>
                })}
            </ul>
        </div>
    )
}

export default FailureAlert;