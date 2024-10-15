package bean;

public class CartDetails extends ProductDetails{
	private int quantity;

	public CartDetails() {
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
