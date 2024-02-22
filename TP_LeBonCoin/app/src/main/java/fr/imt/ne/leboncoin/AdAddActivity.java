package fr.imt.ne.leboncoin;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;

public class AdAddActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ad_add);

        final EditText editTextTitle = findViewById(R.id.editTextTitle);
        final EditText editTextAddress = findViewById(R.id.editTextAddress);
        Button buttonSubmit = findViewById(R.id.buttonSubmit);

        buttonSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent resultIntent = new Intent();
                resultIntent.putExtra("title", editTextTitle.getText().toString());
                resultIntent.putExtra("address", editTextAddress.getText().toString());
                setResult(Activity.RESULT_OK, resultIntent);
                finish();
            }
        });
    }
}
