package com.example.tpleboncoin;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

import com.example.tpleboncoin.AdModel;

public class DBManager {

    public static DBManager DBManager;

    private DBHelper dbHelper;
    private Context context;
    private SQLiteDatabase database;

    private DBManager(Context c) {
        context = c;

        if(fetch().getCount() == 0)
        {
            init();
        }
        //init(); // Useful for adding ads for the first time.
    }

    public static DBManager getDBManager(Context context) {
        if (DBManager == null){
            return new DBManager(context);
        }
        return DBManager;
    }

    public DBManager open() throws SQLException {
        dbHelper = new DBHelper(context);
        database = dbHelper.getWritableDatabase();
        return this;
    }

    public void close() {
        dbHelper.close();
    }

    // Add ads manually.
    public void init(){
        open();

        insert(new AdModel("Canard en plastique", "Paris", "https://le-chat-perche.ch/wp-content/uploads/2019/10/Duck.jpg", 4.00, "0612345678"));
        insert(new AdModel("Trottinette volée", "Lille", "https://www.minimotors.fr/wp-content/uploads/2021/02/Dualtron_Ultra_2_1200x1600_1.jpg", 34.50, "0612345678"));
        insert(new AdModel("Sac gucci", "Douai", "https://www.rouxel.com/400/34632.jpg?ac=20240211", 8900.00, "0612345678"));
        insert(new AdModel("Flûte à bec", "Douai", "https://www.cdiscount.com/pdt2/0/6/7/1/700x700/auc7192568032067/rw/instruments-de-musique-a-vent-en-bois-maped-flut.jpg", 14.99, "0612345678"));
        insert(new AdModel("Tchoupi - L'intégrale", "Douai", "https://m.media-amazon.com/images/I/71mCwArcjuL._AC_UF1000,1000_QL80_.jpg", 74.99, "0612345678"));
        insert(new AdModel("Apple watch", "Nantes", "https://www.montre-enfant.com/images/imageshop/produit/2021/02/m_601d5257c0bd76.34042272.jpeg", 2799.99, "0612345678"));


    }

    public void insert(AdModel ad) {

        if(dbHelper == null)
        {
            open();
        }

        ContentValues contentValue = new ContentValues();
        contentValue.put(DBHelper.TITLE, ad.getTitle());
        contentValue.put(DBHelper.ADDRESS, ad.getAddress());
        contentValue.put(DBHelper.IMAGE, ad.getImage());
        contentValue.put(DBHelper.PRICE, ad.getPrice());
        contentValue.put(DBHelper.PHONE, ad.getPhone());
        database.insert(DBHelper.TABLE_NAME, null, contentValue);
    }

    public Cursor fetch() {

        if(dbHelper == null)
        {
            open();
        }

        String[] columns = new String[] { DBHelper._ID, DBHelper.TITLE, DBHelper.ADDRESS, DBHelper.IMAGE, DBHelper.PRICE, DBHelper.PHONE};
        Cursor cursor = database.query(DBHelper.TABLE_NAME, columns, null, null, null, null, null);
        if (cursor != null) {
            cursor.moveToFirst();
        }
        return cursor;
    }

    public int update(long _id, AdModel ad) {

        if(dbHelper == null)
        {
            open();
        }

        ContentValues contentValues = new ContentValues();
        contentValues.put(DBHelper.TITLE, ad.getTitle());
        contentValues.put(DBHelper.ADDRESS, ad.getAddress());
        //contentValues.put(DBHelper.IMAGE, ad.getImage());
        contentValues.put(DBHelper.PRICE, ad.getPrice());
        contentValues.put(DBHelper.PHONE, ad.getPhone());
        int i = database.update(DBHelper.TABLE_NAME, contentValues, DBHelper._ID + " = " + _id, null);
        return i;
    }

    public void delete(long _id) {

        if(dbHelper == null)
        {
            open();
        }

        database.delete(DBHelper.TABLE_NAME, DBHelper._ID + "=" + _id, null);
    }



    public AdModel getById(int id){

        if(dbHelper == null)
        {
            open();
        }

        return dbHelper.getById(id);
    }

}
