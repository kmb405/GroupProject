package com.codingdojo.group.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.group.models.Pizza;
import com.codingdojo.group.models.User;
import com.codingdojo.group.services.PizzaService;
import com.codingdojo.group.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PizzaController {
	
	@Autowired
	private PizzaService pizzaServ;
	
	@Autowired
	private UserService userServ;
	
	
	@GetMapping("/")
    public String index() {        
		
		return "index.jsp";
    }
    
    @GetMapping("/quickPage")
    public String shelves(Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	List<Pizza> pizzas = pizzaServ.allPizzas();
    	System.out.println(pizzas.size());
    	if (pizzas.size()==0) {
    		Pizza newPizza = new Pizza();
    		List<String> toppings = new ArrayList<>();
    		toppings.add("cheese");
    		newPizza.setDeliveryMethod("Carry Out");
    		newPizza.setCrust("Thin Crust");
    		newPizza.setSize("Large");
    		newPizza.setQuantity("1");
    		newPizza.setToppings(toppings);
    		pizzaServ.createPizza(newPizza);
    		List<Pizza> newPizzas = pizzaServ.allPizzas();
    		model.addAttribute("pizzas", newPizzas);
    		
    	}
//    	
//    	// Random pizza generator 
    	
    		
		Random randomGen = new Random();
		int randomPizzaSize = pizzaServ.allPizzas().size();
		System.out.println("Size" + randomPizzaSize);
		
		if (randomPizzaSize>0) {
			int randomPizzaNum = randomGen.nextInt(randomPizzaSize);
			System.out.println("Num" + randomPizzaNum);
			Pizza randomPizza = pizzas.get(randomPizzaNum);
			model.addAttribute("randomPizza", randomPizza.getId());
		} else {
			model.addAttribute("randomPizza", 1);
		}

//    	
    	    		
		// for now, this works but sometimes generates numbers that
    	// pull from the pizza list but if that pizza has been deleted
    	// it will forward to a blank order.

    	
    	// Fave pizza attempt
    	
		Pizza favPizza = pizzaServ.favoritePizza(userId);
		System.out.println(favPizza);
		Long favId = favPizza.getId(); 
		System.out.println(favId);
		if (favId==null) {
			model.addAttribute("favPizza", 1);
		} else {
			
			model.addAttribute("favPizza", favId);
		}
		
		
		//Trying to get new id from session and put it in the accountSum URL so it directs 
		// to the newest orderSum page. but not woking. 
//		
//			Long newPizzaId = (Long)session.getAttribute("newPizzaId");
//			
//			model.addAttribute("tempPizzaId", newPizzaId = (Long)pizzaServ.findPizza((String)newPizzaId));
//			
//			model.addAttribute("newPizzaId", pizzaServ.findPizza(newPizzaId));
//			System.out.println(newPizzaId);
			
			
			
			
    	// For now, fav pizza will order the first pizza in the User's pizza orders ^
    	
    	
    	return "quickPage.jsp";
    }
    
    @GetMapping("/createPizza")
    public String createPizza(@ModelAttribute("newPizza") Pizza newPizza, HttpSession session, Model model) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {  		
    		return "redirect:/login";
    	}
    	
    	ArrayList<String> pizzaTops = new ArrayList<String>();
    	
    		pizzaTops.add("cheese");
    		pizzaTops.add("pepperoni");
    		pizzaTops.add("bacon");
    		pizzaTops.add("ham");
    		pizzaTops.add("pineapple");
    		pizzaTops.add("jalapenos");
    		pizzaTops.add("anchovies");
    		pizzaTops.add("sausage");
    		pizzaTops.add("spinach");
    		pizzaTops.add("tomato");
    		pizzaTops.add("bell pepper");
    		pizzaTops.add("artichokes");
    		pizzaTops.add("chicken");
    		pizzaTops.add("potatoes");
    		pizzaTops.add("beef");
    		pizzaTops.add("basil");
    		pizzaTops.add("prosciutto");
    		
    		
    	model.addAttribute("pizzaTops", pizzaTops);
    	
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
		
    	return "createPizzaPage.jsp";
    }
    
    @GetMapping("/updatePizza/{id}")
    public String updatePizza(@PathVariable("id") Long id, Model model, HttpSession session, 
    		@ModelAttribute("editPizza") Pizza editPizza) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	Pizza pizza = pizzaServ.findPizza(id);
    	model.addAttribute("pizza", pizza);
    	return "updatePizzaPage.jsp";
    }
    
   
    
    @GetMapping("/orderSum/{id}")
    public String orderSum(@PathVariable("id")Long id, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
  
    	
    	Pizza pizza = pizzaServ.findPizza(id);
    	
    	if ( pizza == null ) {
    		
    		return "orderSumPage.jsp";
    	}
    		
    		
    
    	//_____________Get toppings out of array
    	
    	List<String> toppings = pizza.getToppings();
    	
    	String tempToppings = String.join(", ", toppings);
    	
    	 	
    	model.addAttribute("tempToppings", tempToppings);
    	
    	
    	
    	model.addAttribute("pizza", pizza);
    	return "orderSumPage.jsp";
    }
    
    
    
    
    @PostMapping("/newPizza")
    public String newPizza(@Valid @ModelAttribute("newPizza") Pizza newPizza, 
    		BindingResult result, HttpSession session, Model model) {
    	
    	System.out.print(newPizza.getUser().getId());
		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	
    	if(result.hasErrors()) {
    		System.out.print("test1111111111");
        	ArrayList<String> pizzaTops = new ArrayList<String>();
        	
    		pizzaTops.add("cheese");
    		pizzaTops.add("pepperoni");
    		pizzaTops.add("bacon");
    		pizzaTops.add("ham");
    		pizzaTops.add("pineapple");
    		pizzaTops.add("jalapenos");
    		pizzaTops.add("anchovies");
    		pizzaTops.add("sausage");
    		pizzaTops.add("spinach");
    		pizzaTops.add("tomato");
    		pizzaTops.add("bell pepper");
    		pizzaTops.add("artichokes");
    		pizzaTops.add("chicken");
    		pizzaTops.add("potatoes");
    		pizzaTops.add("beef");
    		pizzaTops.add("basil");
    		pizzaTops.add("prosciutto");
    		
    		
    	model.addAttribute("pizzaTops", pizzaTops);
    	
    	
    		return "createPizzaPage.jsp";
    	} else {
    		System.out.print("test22222222");
    		pizzaServ.createPizza(newPizza);
    		    		
    		session.setAttribute("newPizzaId", newPizza.getId());
    		
    		Long tempPizza = (Long)session.getAttribute("newPizzaId");
    		
    		model.addAttribute("newPizzaId", tempPizza);
    		
    		System.out.println(tempPizza);
    		
    		return "redirect:/orderSum/" + newPizza.getId();
    	}
    	

    	
    	
    	
    }
    
    @PutMapping("/editPizza")
    public String editPizza(@Valid @ModelAttribute("editPizza") Pizza editPizza, BindingResult result, 
    		HttpSession session, Model model) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	if(result.hasErrors()) {
    		model.addAttribute("pizza", editPizza);
    		return "edit.jsp";
    	} else {
    		pizzaServ.updatePizza(editPizza);
    		return "redirect:/orderSum/" + userId;
    	}
    
    }
    
    @GetMapping("/deletePizza/{id}")
    public String deletePizza(@PathVariable("id") Long id, Model model, HttpSession session) {
    	
    	Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/";
    	}
    	System.out.print(id);
    	pizzaServ.deletePizza(id);
    	return "redirect:/createPizza";
    }
}
