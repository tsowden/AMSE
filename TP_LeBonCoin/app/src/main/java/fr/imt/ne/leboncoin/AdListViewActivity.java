package fr.imt.ne.leboncoin;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import java.util.ArrayList;

public class AdListViewActivity extends AppCompatActivity {
    private ArrayList<AdModel> goodies;
    private AdAdapter adapter;
    private ActivityResultLauncher<Intent> addAdActivityResultLauncher;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ad_list_view);

        // Initialisation de la liste des annonces
        ListView listView = findViewById(R.id.listView);
        goodies = new ArrayList<>();
        goodies.add(new AdModel("Lot de 20 cartes collector Assass'imt", "263 rue du Grand Bail, 59500 Douai, Studio 422", R.drawable.cartes));
        goodies.add(new AdModel("Briquet-décapsuleur Al'Aska", "263 rue du Grand Bail, 59500 Douai, Studio 422", R.drawable.briquet));
        goodies.add(new AdModel("Préservatif Queen Art's collector 'Sexy Aurelien'", "263 rue du Grand Bail, 59500 Douai, Chambre 1018", R.drawable.capote));

        // Configuration de l'adapter
        adapter = new AdAdapter(this, goodies);
        listView.setAdapter(adapter);

        // Configuration du clic sur un élément de la liste
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

        // Initialisation du ActivityResultLauncher pour l'ajout d'annonces
        addAdActivityResultLauncher = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                result -> {
                    if (result.getResultCode() == RESULT_OK) {
                        Intent data = result.getData();
                        if (data != null) {
                            String title = data.getStringExtra("title");
                            String address = data.getStringExtra("address");
                            // Supposons qu'une image par défaut est utilisée pour les nouvelles annonces
                            int imageId = R.drawable.default_image; // Remplacez par votre ressource par défaut

                            AdModel newAd = new AdModel(title, address, imageId);
                            goodies.add(newAd);
                            adapter.notifyDataSetChanged();
                        }
                    }
                });
    }

    // Méthode pour lancer AdAddActivity (à appeler depuis un bouton ou autre déclencheur dans votre UI)
    public void launchAdAddActivity() {
        Intent intent = new Intent(this, AdAddActivity.class);
        addAdActivityResultLauncher.launch(intent);
    }
}
