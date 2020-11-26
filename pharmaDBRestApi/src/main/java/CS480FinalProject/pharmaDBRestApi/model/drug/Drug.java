package CS480FinalProject.pharmaDBRestApi.model.drug;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "drugs")
public class Drug {
	
	private String generic_name;
	@Id
	private String brand_name;
	private String purpose;
	private int company_code;
	
	
	
	
	
	public Drug() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Drug(String generic_name, String brand_name, String purpose, int company_code) {
		super();
		this.generic_name = generic_name;
		this.brand_name = brand_name;
		this.purpose = purpose;
		this.company_code = company_code;
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
	 * @return the company_code
	 */
	public int getCompany_code() {
		return company_code;
	}
	/**
	 * @param company_code the company_code to set
	 */
	public void setCompany_code(int company_code) {
		this.company_code = company_code;
	}

	
}
