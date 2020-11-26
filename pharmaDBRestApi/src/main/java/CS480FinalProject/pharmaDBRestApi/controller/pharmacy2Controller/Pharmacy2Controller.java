package CS480FinalProject.pharmaDBRestApi.controller.pharmacy2Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import CS480FinalProject.pharmaDBRestApi.model.pharmacy2Item.Pharmacy2Item;
import CS480FinalProject.pharmaDBRestApi.model.pharmacyItem.Pharmacy1Item;
import CS480FinalProject.pharmaDBRestApi.pharmacy2Item.repository.Pharmacy2ItemRepository;

@RestController
@CrossOrigin
@RequestMapping("/pharmacy2")
public class Pharmacy2Controller {

	@Autowired
	private Pharmacy2ItemRepository pharmacy2;
	
	@GetMapping("/items")
	public List<Pharmacy2Item> getPharmacy2All(){
		return pharmacy2.findAll();
	}

	@GetMapping("/items/{searchBy}")
	public List<Pharmacy2Item> searchitems(@PathVariable String searchBy) {
		return pharmacy2.searchItems(searchBy);
	}
	
	@PostMapping(value = "/items", consumes = "application/json")
	public Pharmacy2Item createDrug(@RequestBody Pharmacy2Item item) {
		return pharmacy2.saveAndFlush(item);
	}
	
	
	@DeleteMapping("/items")
	public Pharmacy2Item deleteDrug(@RequestBody Pharmacy2Item item) {
		pharmacy2.delete(item);
		return item;
	}

	@GetMapping("/drugInfo")
	public List<Object> getDrugInfo(){
		return pharmacy2.getDrugInfo();
	}
	
	@GetMapping("/drugInfo/{searchBy}")
	public List<Object> searchInfo(@PathVariable String searchBy) {
		return pharmacy2.searchDrugInfo(searchBy);
	}
	
	@PutMapping("/items")
	public Pharmacy2Item updateItem(@RequestBody Pharmacy2Item item){
		return pharmacy2.saveAndFlush(item);
	}
	
}
