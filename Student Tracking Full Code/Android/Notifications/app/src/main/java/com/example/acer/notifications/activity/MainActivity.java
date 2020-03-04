package com.example.acer.notifications.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.example.acer.notifications.R;
import com.example.acer.notifications.utilities.SPHandle;

public class MainActivity extends AppCompatActivity {

    EditText ip;
    SPHandle sp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ip=findViewById(R.id.ipaddr);
        sp=new SPHandle(this);

        ip.setText(sp.getIP());

    }

    public void submit(View view) {
        sp.setIP(ip.getText().toString());
        startActivity(new Intent(getApplicationContext(),LoginActivity.class));
    }
}
