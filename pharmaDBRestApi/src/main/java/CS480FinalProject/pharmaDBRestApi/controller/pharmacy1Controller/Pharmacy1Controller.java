package CS480FinalProject.pharmaDBRestApi.controller.pharmacy1Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import CS480FinalProject.pharmaDBRestApi.model.DrugInfo.DrugInfo;
import CS480FinalProject.pharmaDBRestApi.model.company.Company;
import CS480FinalProject.pharmaDBRestApi.model.pharmacyItem.Pharmacy1Item;
import CS480FinalProject.pharmaDBRestApi.pharmacyItem.repository.Pharmacy1ItemRepository;

@RestController
@CrossOrigin
@RequestMapping("/pharmacy1")
public class Pharmacy1Controller {

	@Autowired
	private Pharmacy1ItemRepository pharmacy1;
	
	
	@GetMapping("/items")
	public List<Pharmacy1Item> getPharmacy1All(){
		return pharmacy1.findAll();
	}
	
	
	@PostMapping(value = "/items", consumes = "application/json")
	public Pharmacy1Item createDrug(@RequestBody Pharmacy1Item item) {
		return pharmacy1.saveAndFlush(item);
	}
	
	
	@DeleteMapping("/items")
	public Pharmacy1Item deleteDrug(@RequestBody Pharmacy1Item item) {
		pharmacy1.delete(item);
		return item;
	}

	@GetMapping("/drugInfo")
	public List<Object> getDrugInfo(){
		return pharmacy1.getDrugInfo();
	}
	
	@GetMapping("/drugInfo/{searchBy}")
	public List<Object> searchinfo(@PathVariable String searchBy) {
		return pharmacy1.searchDrugInfo(searchBy);
	}
	
	@GetMapping("/items/{searchBy}")
	public List<Pharmacy1Item> searchitems(@PathVariable String searchBy) {
		return pharmacy1.searchItems(searchBy);
	}
	
	@PutMapping("/items")
	public Pharmacy1Item updateItem(@RequestBody Pharmacy1Item item){
		return pharmacy1.saveAndFlush(item);
	}
}
