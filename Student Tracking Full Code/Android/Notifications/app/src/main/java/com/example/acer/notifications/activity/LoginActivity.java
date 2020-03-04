package com.example.acer.notifications.activity;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.acer.notifications.R;
import com.example.acer.notifications.permisions.BaseActivity;
import com.example.acer.notifications.utilities.DBHandle;
import com.example.acer.notifications.utilities.SPHandle;

import java.util.HashMap;

public class LoginActivity extends BaseActivity {

    private EditText username, password;
    Button login;
    String url = "";
    String imei = "NOIMEI";
    HashMap<String, String> param;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        url = "http://" + new SPHandle(getApplicationContext()).getIP() + "/student_tracking/login.php";
        param = new HashMap<>();
        TelephonyManager telephonyManager = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        imei = telephonyManager.getDeviceId();
        username=findViewById(R.id.login_et_username);
        password=findViewById(R.id.login_et_password);
        login=findViewById(R.id.login_btn_login);
        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                param.put("username",username.getText().toString());
                param.put("password",password.getText().toString());
                param.put("imei",imei);
                new DBHandle(getApplicationContext()).fetch(url,param);
            }
        });
    }
}
