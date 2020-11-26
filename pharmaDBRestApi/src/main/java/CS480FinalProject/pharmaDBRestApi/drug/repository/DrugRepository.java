package CS480FinalProject.pharmaDBRestApi.drug.repository;

import java.util.List;

import org.hibernate.query.NativeQuery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.CrossOrigin;

import CS480FinalProject.pharmaDBRestApi.model.drug.Drug;


@Repository
public interface DrugRepository extends JpaRepository<Drug, String> {

	@Query( value = "SELECT * FROM drugs WHERE brand_name REGEXP :search_by OR generic_name REGEXP :search_by OR purpose REGEXP :search_by",
			nativeQuery = true)
	public List<Drug> searchDrugs(@Param("search_by") String searchBy);
	
	@Query( value = "DELETE FROM drugs WHERE brand_name REGEXP :name;", 
			nativeQuery = true )
	public void deleteDrug(@Param("name") String name);
	
}
