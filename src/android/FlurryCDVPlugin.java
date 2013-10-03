package com.phonegap.plugins.flurry;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import com.flurry.android.FlurryAgent;

import android.util.Log;

/**
 * This class echoes a string called from JavaScript.
 */
public class FlurryCDVPlugin extends CordovaPlugin {

    Context context;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        System.out.println("FlurryCDVPlugin: execute");
        System.out.println(action);
        try{

          if (action.equals("startSession")) {
              FlurryAgent.onStartSession(cordova.getActivity().getApplicationContext(), args.getString(0));
          }
          else if (action.equals("logEvent")) {
              String eventName = args.getString(0);
              this.logEvent(eventName, callbackContext);   
          }
          return true;
        } catch (JSONException e){
            callbackContext.error("flurry json exception: " + e.getMessage());
        }
        return false;
    }

    private void logEvent(String eventName, CallbackContext callbackContext) {
        System.out.println("FlurryCDVPlugin logEvent: " + eventName);
        if (eventName != null && eventName.length() > 0) {
            FlurryAgent.logEvent(eventName);
            callbackContext.success(eventName);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

}