package model;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Product {
	private int id; // id=0 means no id set (a new, unsaved, product)
	private String name;
	private String description;
	private int price;
	
	public Product(String name, String description, int price){
		this(0, name, description, price);
	}
	
	public Product(int id, String name, String description, int price){
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	
	/**
	 * 
	 * @return price formatted with two decimal places to represent pounds & pence (or dollars & cents, or...)
	 */
	public double getFormattedPrice(){
		BigDecimal bd = new BigDecimal(price / 100.0);
	    bd = bd.setScale(2, RoundingMode.HALF_UP);
	    return bd.doubleValue();
	}
	
	public String toString(){
		return name + " " + getFormattedPrice() + "\n" + description;
	}

}