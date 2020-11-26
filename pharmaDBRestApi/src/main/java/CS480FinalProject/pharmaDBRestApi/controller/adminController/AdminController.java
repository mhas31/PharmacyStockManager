package CS480FinalProject.pharmaDBRestApi.controller.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import CS480FinalProject.pharmaDBRestApi.company.repository.CompanyRepository;
import CS480FinalProject.pharmaDBRestApi.drug.repository.DrugRepository;
import CS480FinalProject.pharmaDBRestApi.model.company.Company;
import CS480FinalProject.pharmaDBRestApi.model.drug.Drug;

@RestController
@CrossOrigin(maxAge = 3600)
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private DrugRepository drugRepo;
	
	@Autowired
	private CompanyRepository companyRepo;
		
	@GetMapping("/drugs")
	public List<Drug> getDrugs() {
		return drugRepo.findAll();
	}
	
	@CrossOrigin
	@GetMapping("/drugs/{searchBy}")
	public List<Drug> searchDrugs(@PathVariable String searchBy) {
		return drugRepo.searchDrugs(searchBy);
	}
	
	@PostMapping(value = "/drugs", consumes = "application/json")
	public Drug createDrug(@RequestBody Drug drug) {
		return drugRepo.saveAndFlush(drug);
	}
	
	
	@DeleteMapping("/drugs")
	public Drug deleteDrug(@RequestBody Drug drug) {
		drugRepo.delete(drug);
		return drug;
	}
	

	@GetMapping("/companies")
	public List<Company> getCompanies() {
		return companyRepo.findAll();
	}
	
	@PostMapping(value = "/companies", consumes = "application/json")
	public Company createDrug(@RequestBody Company company) {
		return companyRepo.saveAndFlush(company);
	}
	
	@GetMapping("/companies/{searchBy}")
	public List<Company> searchCompanies(@PathVariable String searchBy) {
		return companyRepo.searchCompanies(searchBy);
	}
	
	@DeleteMapping("/companies")
	public Company deleteDrug(@RequestBody Company company) {
		companyRepo.delete(company);
		return company;
	}

}
