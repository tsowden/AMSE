package fr.imt.ne.leboncoin;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;

public class AdListViewActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ad_list_view); // Assurez-vous d'avoir ce layout

        ListView listView = findViewById(R.id.lvAds); // Remplacez par l'ID de votre ListView

        ArrayList<AdModel> adModels = new ArrayList<>();

        AdAdapter adapter = new AdAdapter(this, adModels);
        listView.setAdapter(adapter);
    }
}
