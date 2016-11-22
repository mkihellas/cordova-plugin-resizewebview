
var argscheck = require('cordova/argscheck'),
  utils = require('cordova/utils'),
  exec = require('cordova/exec');

var PLUGIN_NAME = "ResizeWebview";

var ResizeWebview = function() {};

/* METHODS
**************************************************************************/

ResizeWebview.getFrame = function(successCallback,failCallback) {
  successCallback = successCallback || function(){};
  if (typeof failCallback == 'undefined') {
    failCallback = successCallback;
  }

  exec(successCallback,failCallback, PLUGIN_NAME, "getFrame", []);
};

ResizeWebview.setFrame = function(object, successCallback, failCallback) {
  successCallback = successCallback || function(){};
  if (typeof failCallback == 'undefined') {
    failCallback = successCallback;
  }
  if (!object) {
    successCallback && successCallback("ResizeWebview error: no origin and/or no size");
    return false;
  } else if (object.x == undefined || object.y || undefined) {
    successCallback && successCallback("ResizeWebview error: invalid Origin");
    return false;
  } else if (object.width == undefined || object.height == undefined) {
    successCallback && successCallback("ResizeWebview error: invalid Size");
    return false;
  }
  
  exec(successCallback,failCallback, PLUGIN_NAME, "setFrame", [object.x,object.y, object.width, object.height]);
};

/* EVENTS
****************************************************************************/
ResizeWebview.fireError = function(error) {
    cordova.fireWindowEvent('ResizeWebviewerror',error);
};

module.exports = ResizeWebview;