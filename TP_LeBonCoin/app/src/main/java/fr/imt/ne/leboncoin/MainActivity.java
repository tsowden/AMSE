package fr.imt.ne.leboncoin;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    // Déclarer le ActivityResultLauncher
    private ActivityResultLauncher<Intent> adAddActivityResultLauncher;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialiser le ActivityResultLauncher
        adAddActivityResultLauncher = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                result -> {
                    // Gérer le résultat retourné par AdAddActivity
                    if (result.getResultCode() == RESULT_OK) {
                        // Peut-être transmettre les données reçues à AdListViewActivity ou gérer ici
                        Intent intent = new Intent(MainActivity.this, AdListViewActivity.class);
                        startActivity(intent);
                    }
                });

        Button btnViewAds = findViewById(R.id.btnViewAds);
        Button btnAddAd = findViewById(R.id.btnAddAd);

        btnViewAds.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, AdListViewActivity.class);
            startActivity(intent);
        });

        btnAddAd.setOnClickListener(v -> {
            // Préparer l'intent pour AdAddActivity
            Intent intent = new Intent(MainActivity.this, AdAddActivity.class);
            // Lancer AdAddActivity avec le launcher
            adAddActivityResultLauncher.launch(intent);
        });
    }
}
