package CS480FinalProject.pharmaDBRestApi.company.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import CS480FinalProject.pharmaDBRestApi.model.company.Company;
import CS480FinalProject.pharmaDBRestApi.model.drug.Drug;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Integer> {
	
	@Query( value = "SELECT * FROM companies WHERE company_name REGEXP :search_by OR company_code REGEXP :search_by ",
			nativeQuery = true)
	public List<Company> searchCompanies(@Param("search_by") String searchBy);

}
