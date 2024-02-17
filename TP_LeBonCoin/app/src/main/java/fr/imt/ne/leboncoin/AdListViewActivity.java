package fr.imt.ne.leboncoin;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import java.util.ArrayList;

public class AdListViewActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ad_list_view);

        ListView listView = findViewById(R.id.listView);
        final ArrayList<AdModel> goodies = new ArrayList<>();
        goodies.add(new AdModel("Lot de 20 cartes collector Assass'imt", "263 rue du Grand Bail, 59500 Douai, Studio 422", R.drawable.cartes));
        goodies.add(new AdModel("Briquet-décapsuleur Al'Aska", "263 rue du Grand Bail, 59500 Douai, Studio 422", R.drawable.briquet));
        goodies.add(new AdModel("Préservatif Queen Art's collector 'Sexy Aurelien'", "263 rue du Grand Bail, 59500 Douai, Chambre 1018", R.drawable.capote));

        AdAdapter adapter = new AdAdapter(this, goodies);
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                AdModel selectedAd = goodies.get(position);

                Intent intent = new Intent(AdListViewActivity.this, AdViewActivity.class);
                intent.putExtra("title", selectedAd.getTitle());
                intent.putExtra("address", selectedAd.getAddress());
                intent.putExtra("image", selectedAd.getImage());

                startActivity(intent);
            }
        });
    }
}
