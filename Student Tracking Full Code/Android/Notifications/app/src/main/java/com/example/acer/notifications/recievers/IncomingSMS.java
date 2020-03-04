package com.example.acer.notifications.recievers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.telephony.SmsMessage;
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

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by User on 3/20/2018.
 */
public class IncomingSMS extends BroadcastReceiver {
    String messageReceived = "";
    private Context mcontext;
    String ip="";
    String imei;
    String time = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
    String phonenumber,info;
    SharedPreferences sp;
    public static final String TAG = IncomingSMS.class.getSimpleName();
    @Override
    public void onReceive(Context context, Intent intent) {
     mcontext=context;
        Bundle bundle = intent.getExtras();
        Object messages[] = (Object[]) bundle.get("pdus");
       // String messageReceived = "";

            ip = new SPHandle(context).getIP();



        SmsMessage SMS[] = new SmsMessage[messages.length];
        for (int n = 0; n < messages.length; n++)
        {
            SMS[n] = SmsMessage.createFromPdu((byte[]) messages[n]);


            messageReceived += SMS[n].getMessageBody().toString();
            //   messageReceived += SMS[n].getOriginatingAddress().toString();
            messageReceived += "\n";
        }
        Toast.makeText(context, "SMS: "+messageReceived, Toast.LENGTH_SHORT).show();
        phonenumber=SMS[0].getOriginatingAddress();

        info="Incoming SMS from: "+phonenumber+" at "+time;

        TelephonyManager tm=(TelephonyManager)context.getSystemService(Context.TELEPHONY_SERVICE);
        imei=tm.getDeviceId();

        Log.i("IncomingCallReceiver","Imea: " + info);

        insertsms();
    }

    public void insertsms(){
        String url = "http://" +ip+"/student_tracking/sms_info.php";
        Log.d("res", url);
      Toast.makeText(mcontext, "details:"+imei+" "+url, Toast.LENGTH_SHORT).show();

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
                params.put("number", phonenumber);
                //params.put("status", "INCOMING");
                params.put("body", ""+ messageReceived);
                return params;
            }
        };
        RequestQueue requestQueue= Volley.newRequestQueue(mcontext);
        requestQueue.add(stringRequest);
    }
}
