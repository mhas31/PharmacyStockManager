package CS480FinalProject.pharmaDBRestApi.pharmacyItem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import CS480FinalProject.pharmaDBRestApi.model.DrugInfo.DrugInfo;
import CS480FinalProject.pharmaDBRestApi.model.drug.Drug;
import CS480FinalProject.pharmaDBRestApi.model.pharmacyItem.Pharmacy1Item;


@Repository
public interface Pharmacy1ItemRepository extends JpaRepository<Pharmacy1Item, Integer> {
	
	@Query( value = "SELECT * FROM pharmacy1 WHERE brand_name REGEXP :search_by OR id REGEXP :search_by  ",
			nativeQuery = true)
	public List<Pharmacy1Item> searchItems(@Param("search_by") String searchBy);

	
	@Query( value = "SELECT id, brand_name, generic_name, purpose, company_name, company_code "
			+ "FROM pharmacy1 LEFT JOIN drugs USING(brand_name) LEFT JOIN companies USING(company_code)", 
			nativeQuery = true)
	public List<Object> getDrugInfo();
	
	@Query( value = "SELECT id, brand_name, generic_name, purpose, company_name, company_code "
			+ "FROM pharmacy1 LEFT JOIN drugs USING(brand_name) LEFT JOIN companies USING(company_code) "
			+ "WHERE id REGEXP :search_by OR brand_name REGEXP :search_by OR generic_name REGEXP :search_by "
			+ "OR purpose REGEXP :search_by OR company_name REGEXP :search_by ", 
			nativeQuery = true)
	public List<Object> searchDrugInfo(@Param("search_by") String searchBy);
	
}
