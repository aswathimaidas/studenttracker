package com.example.acer.notifications.recievers;

import android.Manifest;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.Toast;


import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.acer.notifications.utilities.SPHandle;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by User on 3/16/2018.
 */
public class IncomingCalls extends BroadcastReceiver {

    String ip = "", imei = "",date="";
    int c = 0;
    Context context;
    String incomingNumber;
    SharedPreferences sp;
    String incnumber;

    public static final String TAG = IncomingCalls.class.getSimpleName();

    @Override
    public void onReceive(final Context context, final Intent intent) {
        date=getDateTime();
        ip = new SPHandle(context).getIP();
        TelephonyManager telephony = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        imei = telephony.getDeviceId();

        final String state1 = intent.getStringExtra(TelephonyManager.EXTRA_STATE);
        telephony.listen(new PhoneStateListener(){
            @Override
            public void onCallStateChanged(int state, final String incomingNumber) {
                super.onCallStateChanged(state, incomingNumber);
                if(state1.equals(TelephonyManager.EXTRA_STATE_RINGING)){

                  //  insertcall();

                    if(!incomingNumber.equals(""))
                    {
                        incnumber=intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER);
                    }
                    else if(!incomingNumber.equals(""))
                    {
                        incnumber=incomingNumber;
                    }
                    else
                    {
                        incnumber=intent.getStringExtra(Intent.EXTRA_PHONE_NUMBER);
                    }
                    String url = "http://" +ip +"/student_tracking/call_info.php";
                    Log.d("res", url);
                    // Toast.makeText(context, "details:"+imei+" "+incomingNumber, Toast.LENGTH_SHORT).show();

                    StringRequest stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Log.d(TAG, "onResponse:" + response);

                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {
                            Log.d(TAG, "onErrorResponse:" + error);

                        }
                    }){
                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            Map<String, String> params = new HashMap<>();
                            params.put("imei", imei);
                            params.put("type","INCOMING");
                            params.put("number",incnumber);
                            params.put("time",date);

                            return params;
                        }
                    };
                    RequestQueue requestQueue= Volley.newRequestQueue(context);
                    requestQueue.add(stringRequest);


                }
            }
        },PhoneStateListener.LISTEN_CALL_STATE);
    }

    private String getDateTime() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        return dateFormat.format(date);
    }
    public void insertcall(){
        String url = "http://" +ip +"/student_tracking/call_info.php";
        Log.d("res", url);
       // Toast.makeText(context, "details:"+imei+" "+incomingNumber, Toast.LENGTH_SHORT).show();

        StringRequest stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d(TAG, "onResponse:" + response);


            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d(TAG, "onErrorResponse:" + error);

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("imei", imei);
                params.put("type","INCOMING");
                params.put("number",incnumber);
                params.put("time",date);

                return params;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(context);
        requestQueue.add(stringRequest);
    }

    }



