package fr.imt.ne.leboncoin;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

public class AdAdapter extends BaseAdapter {
    private final Context context;
    private final ArrayList<AdModel> adModelArrayList;
    private final LayoutInflater inflater;

    // Constructor
    public AdAdapter(Context context, ArrayList<AdModel> adModelArrayList) {
        this.context = context;
        this.adModelArrayList = adModelArrayList;
        inflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return adModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return adModelArrayList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position; // on définit ici ID = position de l'élément
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        AdModel ad = adModelArrayList.get(position);

        if (convertView == null) {
            convertView = inflater.inflate(R.layout.item_listview_ad, parent, false);
        }

        ImageView imageViewAd = convertView.findViewById(R.id.imageViewAd);
        TextView textViewTitle = convertView.findViewById(R.id.textViewTitle);
        TextView textViewAddress = convertView.findViewById(R.id.textViewAddress);

        imageViewAd.setImageResource(ad.getImage());
        textViewTitle.setText(ad.getTitle());
        textViewAddress.setText(ad.getAddress());

        // Return the completed view to render on screen
        return convertView;
    }
}
