package CS480FinalProject.pharmaDBRestApi.model.company;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name = "companies")
public class Company {
	
	@Id
	@Column(name = "company_code")
	private int company_code;
	private String company_name;
	
	
	
	
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Company(int company_code, String company_name) {
		super();
		this.company_code = company_code;
		this.company_name = company_name;
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
	
	

}
