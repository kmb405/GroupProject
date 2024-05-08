package com.codingdojo.group.services;



import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.group.models.Pizza;
import com.codingdojo.group.repositories.PizzaRepository;

@Service
public class PizzaService {
	
	@Autowired
	private PizzaRepository pizzaRepo;
	
	@Autowired
	private UserService userServ;
	
	public List<Pizza> allPizzas() {
		return pizzaRepo.findAll();
	}
	
	public Pizza createPizza(Pizza pizza) {
		return pizzaRepo.save(pizza);
	}

	public Pizza updatePizza(Pizza pizza) {
		Pizza oldPizza = pizzaRepo.findById(pizza.getId()).get();
		oldPizza.setDeliveryMethod(pizza.getDeliveryMethod());
		oldPizza.setSize(pizza.getSize());
		oldPizza.setCrust(pizza.getCrust());
		oldPizza.setQuantity(pizza.getQuantity());
		oldPizza.setToppings(pizza.getToppings());
		return pizzaRepo.save(oldPizza);
	}
	
	public Pizza findPizza(Long id) {
		Optional<Pizza> optionalPizza = pizzaRepo.findById(id);
		if (optionalPizza.isPresent()) {
			return optionalPizza.get();
		} else {
			return null;
		}
	}
	
	public List<Pizza> findAllById(Long userId) {
		List<Pizza> userPizzas = pizzaRepo.findByUserId(userId);
		return userPizzas;
		
	}
	
	public Pizza favoritePizza(Long userId) {
		
		List<Pizza> favPizza = userServ.findById(userId).getPizza();
		
		// Create a HashMap to store the frequencies of each object
        HashMap<Integer, Integer> frequencies = new HashMap<>();

        // Iterate over the ArrayList and count the frequencies of each object
        for (Pizza pizza : favPizza) {
        	var hashcode = 0;
        	hashcode += pizza.getCrust().hashCode();
        	hashcode += pizza.getSize().hashCode();
        	hashcode += pizza.getToppings().hashCode();
            if (frequencies.containsKey(hashcode)) {
                frequencies.put(hashcode, frequencies.get(hashcode) + 1);
            } else {
                frequencies.put(hashcode, 1);
            }
        }
//        System.out.println(frequencies);

        // Find the object with the highest frequency
        int maxFrequency = 0;
        Integer mostFrequent = null;
        for (Entry<Integer, Integer> entry : frequencies.entrySet()) {
            if (entry.getValue() > maxFrequency) {
                maxFrequency = entry.getValue();
                mostFrequent = entry.getKey();
            }
        }
        Pizza fav = new Pizza();
        for (Pizza pizza : favPizza) {
        	var hashcode = 0;
        	hashcode += pizza.getCrust().hashCode();
        	hashcode += pizza.getSize().hashCode();
        	hashcode += pizza.getToppings().hashCode();
        	if (hashcode == mostFrequent) {
        		fav = pizza;
        	}
        	
        }
	    return fav;
		
	}
	
	public void deletePizza(Long id) {
		pizzaRepo.deleteById(id);
	}
	
	public List<Pizza> getAllOrdersSortedByCreatedAtDesc() {
        return pizzaRepo.findAllByOrderByCreatedAtDesc();
    }
}
