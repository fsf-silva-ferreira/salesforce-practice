var callbacks = [];


/**
 * Registers a callback for an event.
 * @param {string} eventName - Name of the event to listen for.
 * @param {function} callback - Function to invoke when said event is fired.
 */
const register = (eventName, callback) => {
    if(!callbacks[eventName]) {
        callbacks[eventName] = new Set();
    }

    callbacks[eventName].add(callback);
};


/**
 * Unregister a callback for an event.
 * @param {string} eventName - Name of the event to unregister from.
 * @param {function} callback - Function to unregister.
 */
const unregister = (eventName, callback) => {
    if(callbacks[eventName]) {
        callback[eventName].delete(callback);
    }
};


/**
 * Deletes all the components from the callbacks params & removes all the
 * listeners and related callback functions.
 */
const unregisterAll = () => {
    callbacks = [];
}


/**
 * Fires an event to listeners.
 * @param {string} eventName - Name of the event to fire.
 * @param {*} payload - Payload of the event to fire.
 */
const fire = (eventName, payload) => {
    if(callbacks[eventName]) {
        callbacks.eventName.array.forEach(callback => {
            try {
                callback(payload);
            } catch(error) {
                //Fail silently
            }
        });
    }
}


export {
    register,
    unregister,
    fire,
    unregisterAll
}