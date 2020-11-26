package CS480FinalProject.pharmaDBRestApi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import CS480FinalProject.pharmaDBRestApi.company.repository.CompanyRepository;
import CS480FinalProject.pharmaDBRestApi.drug.repository.DrugRepository;
import CS480FinalProject.pharmaDBRestApi.model.company.Company;
import CS480FinalProject.pharmaDBRestApi.model.drug.Drug;
import CS480FinalProject.pharmaDBRestApi.model.pharmacy2Item.Pharmacy2Item;
import CS480FinalProject.pharmaDBRestApi.model.pharmacyItem.Pharmacy1Item;
import CS480FinalProject.pharmaDBRestApi.pharmacy2Item.repository.Pharmacy2ItemRepository;
import CS480FinalProject.pharmaDBRestApi.pharmacyItem.repository.Pharmacy1ItemRepository;

@SpringBootApplication
@RestController
public class PharmaDbRestApiApplication {

	@GetMapping("/hello")
	public String helloWorld() {
		return "hello world";
	}
	
	public static void main(String[] args) {
		SpringApplication.run(PharmaDbRestApiApplication.class, args);
	}

}
