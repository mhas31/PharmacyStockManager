package CS480FinalProject.pharmaDBRestApi.model.DrugInfo;

import javax.persistence.Entity;


public class DrugInfo {
	
	String brand_name;
	String generic_name;
	String purpose;
	String company_name;
	Integer company_code;
	Integer id;
	
	
	
	
	public DrugInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DrugInfo(String brand_name, String generic_name, String purpose, String company_name, Integer company_code,
			Integer id) {
		super();
		this.brand_name = brand_name;
		this.generic_name = generic_name;
		this.purpose = purpose;
		this.company_name = company_name;
		this.company_code = company_code;
		this.id = id;
	}
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
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
	 * @return the generic_name
	 */
	public String getGeneric_name() {
		return generic_name;
	}
	/**
	 * @param generic_name the generic_name to set
	 */
	public void setGeneric_name(String generic_name) {
		this.generic_name = generic_name;
	}
	/**
	 * @return the purpose
	 */
	public String getPurpose() {
		return purpose;
	}
	/**
	 * @param purpose the purpose to set
	 */
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	/**
	 * @return the company_name
	 */
	public String getCompany_name() {
		return company_name;
	}
	/**
	 * @param company_name the company_name to set
	 */
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	/**
	 * @return the company_code
	 */
	public Integer getCompany_code() {
		return company_code;
	}
	/**
	 * @param company_code the company_code to set
	 */
	public void setCompany_code(Integer company_code) {
		this.company_code = company_code;
	}
}
