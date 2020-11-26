package CS480FinalProject.pharmaDBRestApi.model.pharmacyItem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "pharmacy1")
public class Pharmacy1Item {
	
	@Id
	private int id;
	
	@Column(name = "brand_name")
	private String brand_name;
	private int quantity;
	private double price;
	public Pharmacy1Item(int id, String brand_name, int quantity, double price) {
		super();
		this.id = id;
		this.brand_name = brand_name;
		this.quantity = quantity;
		this.price = price;
	}
	public Pharmacy1Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the brand_name
	 */
	public String getBrand_name() {
		return brand_name;
	}
	/**
	 * @param brand_name the brand_name to set
	 */
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	
	

}
