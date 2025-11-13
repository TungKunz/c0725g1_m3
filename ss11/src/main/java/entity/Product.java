package entity;

public class Product {
    private String id;
    private String name;
    private float price;
    private String nsx;

    public Product(String id, String name, float price, String nsx) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.nsx = nsx;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getNsx() {
        return nsx;
    }

    public void setNsx(String nsx) {
        this.nsx = nsx;
    }
}
