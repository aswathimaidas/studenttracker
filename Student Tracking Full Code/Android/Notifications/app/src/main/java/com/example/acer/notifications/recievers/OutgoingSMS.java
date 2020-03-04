package com.example.acer.notifications.recievers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.widget.Toast;

/**
 * Created by User on 3/20/2018.
 */
public class OutgoingSMS extends BroadcastReceiver {
    private Context ctx;
    String ip="";
    String imei;
    SharedPreferences sp;
    public static final String TAG = OutgoingSMS.class.getSimpleName();
    @Override
    public void onReceive(Context context, Intent intent) {

        if (intent.getAction().equals("android.provider.Telephony.SMS_RECEIVED")){
            Toast.makeText(ctx, "Outgoing:", Toast.LENGTH_SHORT).show();
        }else  if(intent.getAction().equals("android.provider.Telephony.SMS_SENT")){
            //do something with the sended sms
            Toast.makeText(ctx, "Outgoing:", Toast.LENGTH_SHORT).show();
        }

    }
}
