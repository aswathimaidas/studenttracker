package com.example.acer.notifications.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.example.acer.notifications.R;
import com.example.acer.notifications.model.Notification;

import java.util.List;

public class NotiAdapter extends ArrayAdapter {
    Context context;
    List<Notification> notifications;
    public NotiAdapter(Context context, int resource, List<Notification> list) {
        super(context, 0,list);
        this.context=context;
        this.notifications=list;

    }


    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View listItem=convertView;
        if(listItem == null)
        {
            listItem=LayoutInflater.from(context).inflate(R.layout.list_item,parent,false);
            Notification ns=notifications.get(position);
            TextView id = listItem.findViewById(R.id.item_id);
            TextView noti=listItem.findViewById(R.id.notification_id);
            id.setText(ns.getId());
            noti.setText(ns.getNotification());
        }
        return listItem;
    }
}
