package Bean;

public class HistoryBean {
	private String unique_id;
	private String item_type;
	private String item_name;
	private int date_of_purchase;
	private int price_of_purchase;
	
	public String getUnique_id() {
		return unique_id;
	}
	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getDate_of_purchase() {
		return date_of_purchase;
	}
	public void setDate_of_purchase(int date_of_purchase) {
		this.date_of_purchase = date_of_purchase;
	}
	public int getPrice_of_purchase() {
		return price_of_purchase;
	}
	public void setPrice_of_purchase(int price_of_purchase) {
		this.price_of_purchase = price_of_purchase;
	}
}
