package com.codingdojo.group.controllers;

import java.util.List;

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
    	model.addAttribute("pizzas", pizzas);
    	return "quickPage.jsp";
    }
    
    @GetMapping("/createPizza")
    public String createPizza(@ModelAttribute("newPizza") Pizza newPizza, HttpSession session, Model model) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {  		
    		return "redirect:/login";
    	}
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
    	return "createPizzaPage.jsp";
    }
    
    @GetMapping("/updatePizza/{id}")
    public String updatePizza(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("editPizza") Pizza editPizza) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	Pizza pizza = pizzaServ.findPizza(id);
    	model.addAttribute("pizza", pizza);
    	return "updatePizzaPage.jsp";
    }
    
    @GetMapping("/account/{id}")
    public String account(@PathVariable("id") Long id, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	User user = userServ.findById(id);
    	model.addAttribute("user", user);
    	return "accountPage.jsp";
    }
    
    @GetMapping("/orderSum/{id}")
    public String orderSum(@PathVariable("id") Long id, Model model, HttpSession session) {

		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	Pizza pizza = pizzaServ.findPizza(id);
    	model.addAttribute("pizza", pizza);
    	return "orderSumPage.jsp";
    }
    
    @PostMapping("/newPizza")
    public String newPizza(@Valid @ModelAttribute("newPizza") Pizza newPizza, BindingResult result, HttpSession session) {
    	System.out.print(newPizza.getUser());
		Long userId = (Long) session.getAttribute("userId");
    	
    	if(userId==null) {
    		return "redirect:/login";
    	}
    	
    	if(result.hasErrors()) {
    		return "createPizzaPage.jsp";
    	} else {
    		pizzaServ.createPizza(newPizza);
    		return "redirect:/orderSum/" + userId;
    	}
    
    }
    
    @PutMapping("/editPizza")
    public String editPizza(@Valid @ModelAttribute("editPizza") Pizza editPizza, BindingResult result, HttpSession session, Model model) {

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
    	
    	pizzaServ.deletePizza(id);
    	return "redirect:/orderSum/" + userId;
    }
}
