package com.example.leboncoin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.leboncoin.R;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button Display = (Button) findViewById(R.id.buttonDisplay);
        Button Add = (Button) findViewById(R.id.buttonAdd);
        Display.setOnClickListener (new View.OnClickListener(){
            @Override
            public void onClick (View view){
                Intent lancementAdListViewActivity = new Intent(MainActivity.this, AdListViewActivity.class);
                startActivity (lancementAdListViewActivity);
            }
        });
        Add.setOnClickListener (new View.OnClickListener(){
            @Override
            public void onClick (View view){
                Intent lancementAdAddActivity = new Intent(MainActivity.this, AdAddActivity.class);
                startActivity (lancementAdAddActivity);
            }
        });
    }
}