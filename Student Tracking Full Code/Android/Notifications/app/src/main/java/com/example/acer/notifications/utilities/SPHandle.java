package com.example.acer.notifications.utilities;

import android.content.Context;
import android.content.SharedPreferences;

public class SPHandle {
    Context context;
    SharedPreferences sp;
    SharedPreferences.Editor et;
    String FILE_NAME="appdata";
    public SPHandle(Context context) {
        this.context = context;
        sp=context.getSharedPreferences(FILE_NAME,Context.MODE_PRIVATE);
        et=sp.edit();
    }
    public void setIP(String ip)
    {
        et.putString("ip",ip);
        et.commit();
    }
    public String getIP()
    {
        return sp.getString("ip","");
    }
    public void setResponse(String response)
    {
        et.putString("response",response);
        et.apply();
    }
    public String getResponse()
    {
        return sp.getString("response","");
    }

}
