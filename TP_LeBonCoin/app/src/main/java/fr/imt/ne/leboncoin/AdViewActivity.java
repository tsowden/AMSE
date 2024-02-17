package fr.imt.ne.leboncoin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class AdViewActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ad_view);

        ImageView imageView = findViewById(R.id.adImageView);
        TextView titleTextView = findViewById(R.id.adTitleTextView);
        TextView addressTextView = findViewById(R.id.adAddressTextView);

        Intent intent = getIntent();
        String title = intent.getStringExtra("title");
        String address = intent.getStringExtra("address");
        int imageResId = intent.getIntExtra("image", 0);

        titleTextView.setText(title);
        addressTextView.setText(address);
        imageView.setImageResource(imageResId);
    }

}