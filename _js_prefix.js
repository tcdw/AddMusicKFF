let logger = function() {}

Module['print'] = function(message) { 
    logger(message, 'stdout'); 
};

Module['printErr'] = function(message) { 
    logger(message, 'stderr'); 
};

export function setLogger(func) {
    logger = func;
}
