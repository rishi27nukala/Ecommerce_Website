package bean;

public class ProductDetails {
    private int id;
    private String name;
    private String category;
    private float price; 
    private byte[] image; 

    public ProductDetails() {
    }

    public ProductDetails(int id, String name, String category, float price, byte[] image) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public float getPrice() { // Change the return type to float
        return price;
    }

    public void setPrice(float price) { // Change the parameter type to float
        this.price = price;
    }

    public byte[] getImage() { // Change the return type to byte[]
        return image;
    }

    public void setImage(byte[] image) { // Change the parameter type to byte[]
        this.image = image;
    }


    public String toString() {
        return "ProductDetails [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + "]";
    }
}
