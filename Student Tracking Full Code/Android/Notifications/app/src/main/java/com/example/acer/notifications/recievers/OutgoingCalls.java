package com.example.acer.notifications.recievers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.telephony.TelephonyManager;
import android.util.Log;

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
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by User on 3/20/2018.
 */
public class OutgoingCalls extends BroadcastReceiver {

    String ip="",imei="",date="";
    int c=0;
    Context context;

    SharedPreferences sp;

    public static final String TAG = IncomingCalls.class.getSimpleName();


    @Override
    public void onReceive(Context context, Intent intent) {
        date=getDateTime();
        ip = new SPHandle(context).getIP();
        TelephonyManager telephony = (TelephonyManager)context.getSystemService(Context.TELEPHONY_SERVICE);
        imei=telephony.getDeviceId();

        final String number = intent.getStringExtra(Intent.EXTRA_PHONE_NUMBER).toString();

        TelephonyManager  tm=(TelephonyManager)context.getSystemService(Context.TELEPHONY_SERVICE);
        final String imei=tm.getDeviceId();
       // insertcall();


        String url = "http://" +ip +"/student_tracking/call_info.php";
        Log.d("res", url);
        // Toast.makeText(context, "details:"+imei+" "+incomingNumber, Toast.LENGTH_SHORT).show();

        StringRequest stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                Log.d(TAG, "onResponse:" + response+"outgoing");


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
                params.put("type","OUTGOING");
                params.put("number",number);
                params.put("time",date);

                return params;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(context);
        requestQueue.add(stringRequest);
    }
    private String getDateTime() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        return dateFormat.format(date);
    }

   /* public void insertcall(){
        String url = "http://" +ip +"/emp_meeting/insert_call.php";
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
                params.put("status","OUTGOING");
                params.put("number",number);

                return params;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(context);
        requestQueue.add(stringRequest);
    }*/

    private Context ctx;
    private OutgoingCalls outgoingDetector;



    public void start(){

        IntentFilter intentFilter = new IntentFilter(Intent.ACTION_NEW_OUTGOING_CALL);
        ctx.registerReceiver(outgoingDetector, intentFilter);
    }

    public void stop(){

        ctx.unregisterReceiver(outgoingDetector);
    }

}
