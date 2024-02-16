package fr.imt.ne.leboncoin;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnViewAds = findViewById(R.id.btnViewAds);
        Button btnAddAd = findViewById(R.id.btnAddAd);

        btnViewAds.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AdListViewActivity.class);
                startActivity(intent);
            }
        });

        btnAddAd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AdAddActivity.class);
                startActivity(intent);
            }
        });
    }
}
