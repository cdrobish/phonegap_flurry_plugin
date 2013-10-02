var exec = require('cordova/exec');
/**
 * Constructor
 */
function FlurryPlugin() {}

FlurryPlugin.prototype.logEvent = function(eventName, parameters, success, error) {
  exec(function(result){
      // result handler
      console.log('called FlurryPlugin:logEvent');
      console.log(result);
    },
    function(error){
      // error handler
      console.log("Error" + error);
    }, 
    "FlurryPlugin", 
    "logEvent", 
    [eventName, parameters]
  );

}

FlurryPlugin.prototype.startSession = function(apiKey, parameters, success, error) {
  exec(function(result){
      // result handler
      console.log('called FlurryPlugin:startSession');
      console.log(result);
    },
    function(error){
      // error handler
      console.log("Error" + error);
    }, 
    "FlurryPlugin", 
    "startSession", 
    [apiKey, parameters]
  );

}

var flurryPlugin = new FlurryPlugin();
module.exports = flurryPlugin;

