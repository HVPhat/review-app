const getItem = (itemName) => sessionStorage.getItem(itemName);

const saveItem = (itemName, itemValue) => {
    sessionStorage.setItem(itemName, itemValue);
};

export const loadUser = () => JSON.parse(getItem('user'));

export const saveUser = (user) => {
    saveItem('user', JSON.stringify(user));
};

export const loadJWT = () => getItem('token');

export const saveJWT = (token) => {
    saveItem('token', token);
};
export const clearState = () => {
    sessionStorage.clear();
};