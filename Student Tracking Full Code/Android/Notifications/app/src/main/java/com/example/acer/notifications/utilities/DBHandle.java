package com.example.acer.notifications.utilities;

import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.acer.notifications.activity.HomeActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class DBHandle {
    Context context;
    StringRequest stringRequest;
    RequestQueue requestQueue;
    AudioManager mobilemode;
    private String TAG="DBHANDLETAG";
    HashMap<String,String> params;
    String url="";
    public DBHandle(Context context) {
        this.context = context;
        requestQueue=Volley.newRequestQueue(context);
            mobilemode = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
         }
    public void fetch(final String url, final HashMap<String,String> params)
    {
        stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d(TAG, "onResponse: "+response);
                parse(response,url);

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d(TAG, "onErrorResponse: "+error.getLocalizedMessage());
            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                return params;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void parse(String response, String url) {
        if(url.contains("login"))
        {
            logindata(response);
        }
        else if(url.contains("notification"))
        {
            notificationdata(response);
        }
        else  if(url.contains("audio"))
        {
            audio(response);
        }
    }

    private void audio(String response) {
        if(response.equals("1"))
        {
            mobilemode.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
        }
        else if(response.equals("2"))
        {
            mobilemode.setRingerMode(AudioManager.RINGER_MODE_VIBRATE);
        }
        else
        {
            Log.d(TAG, "audio: "+response);
        }
    }

    private void notificationdata(String response) {
        new SPHandle(context).setResponse(response);


    }

    private void logindata(String response) {
        Log.d(TAG, "logindata: "+response);
        try {
            JSONObject result=new JSONObject(response);
            String success=result.getString("success");
            if(success.equals("true"))
            {
                context.startActivity(new Intent(context,HomeActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            }
            else
            {
                Toast.makeText(context, "Invalid username/Password", Toast.LENGTH_SHORT).show();
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
