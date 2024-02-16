package fr.imt.ne.leboncoin;
public class AdModel {
    private String title;
    private String address;
    private int image;

    public AdModel(String title, String address, int image) {
        this.title = title;
        this.address = address;
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    // Getter and Setter for address
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // Getter and Setter for image
    public int getImage() {
        return image;
    }

    public void setImage(int image) {
        this.image = image;
    }
}
