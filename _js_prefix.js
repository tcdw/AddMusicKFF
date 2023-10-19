let logger = function() {}

Module['print'] = (message) => { 
    logger(message, 'stdout'); 
};

Module['printErr'] = (message) => { 
    logger(message, 'stderr'); 
};

Module["setLogger"] = (func) => {
    logger = func;
}
