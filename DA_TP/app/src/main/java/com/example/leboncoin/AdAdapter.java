package com.example.leboncoin;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.ArrayList;

public class AdAdapter extends BaseAdapter {

    private final Context context;
    private final ArrayList<AdModel> adModelArrayList;
    private final LayoutInflater inflater;
    // Constructor
    public AdAdapter(Context context, ArrayList<AdModel> adModelArrayList) {
        this.context = context;
        this.adModelArrayList = adModelArrayList;
        inflater = (LayoutInflater.from(context));
    }


    @Override
    public int getCount() {
        return adModelArrayList.size();
    }

    @Override
    public Object getItem(int i) {
        return adModelArrayList.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        AdModel ad = adModelArrayList.get(i);
        view = inflater.inflate(R.layout.item_listview_ad, null);
        ImageView imageIV = (ImageView) view.findViewById(R.id.imageView);
        TextView titleTV = (TextView) view.findViewById(R.id.textView);
        TextView addressTV = (TextView) view.findViewById(R.id.textView2);
        imageIV.setImageResource(ad.getImage());
        titleTV.setText(ad.getTitle());
        addressTV.setText(ad.getAddress());
        return view;
    }
}
