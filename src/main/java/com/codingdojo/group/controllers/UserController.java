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

import com.codingdojo.group.models.LoginUser;
import com.codingdojo.group.models.Pizza;
import com.codingdojo.group.models.User;
import com.codingdojo.group.services.PizzaService;
import com.codingdojo.group.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
    
    // Add once service is implemented:
     @Autowired
     private UserService userServ;
     
     @Autowired
     private PizzaService pizzaServ;
    
    
    
    @GetMapping("/login")
    public String login(@ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") LoginUser newLogin, HttpSession session) {
    	
    	return "loginPage.jsp";
    }
    
    @GetMapping("/register")
    public String register(@ModelAttribute("newUser") User newUser, HttpSession session) {
    	
    	return "registrationPage.jsp";
    }
    
    @GetMapping("/account/{id}")
    public String account(@PathVariable("id") Long userId, Model model, HttpSession session, @ModelAttribute("editUser") User editUser) {

		Long userSessionId = (Long) session.getAttribute("userId");
    	
    	if(userSessionId==null) {
    		return "redirect:/login";
    	}
    	List<Pizza> pizzas = pizzaServ.findAllById(userId);
    	User user = userServ.findById(userId);
    	model.addAttribute("pizzas", pizzas);
    	model.addAttribute("user", user);
    	return "accountPage.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	
    	session.invalidate();
    	
    	return "redirect:/";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "registrationPage.jsp";
        }
        
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
        userServ.register(newUser, result);
        session.setAttribute("userId", newUser.getId());
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        
    
        return "redirect:/quickPage";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
    	
        
        // Add once service is implemented:
        User thisUser = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "loginPage.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", thisUser.getId());
        session.setAttribute("userName", thisUser.getFirstName()+ " " + thisUser.getLastName());
        Long userId = (Long) session.getAttribute("userId");
        
        if(userId==null) {
    		return "redirect:/";
    	}
    
        return "redirect:/quickPage";
    }
    
    @PutMapping("/editUser")
    public String editUser(@Valid @ModelAttribute("editUser") User editUser, BindingResult result, Model model, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
        
    	if(userId==null) {
    		return "redirect:/";
    	}
		if(result.hasErrors()) {
			List<Pizza> pizzas = pizzaServ.findAllById(userId);
	    	User user = userServ.findById(userId);
	    	model.addAttribute("pizza", pizzas);
	    	model.addAttribute("user", user);
	    	return "accountPage.jsp";
		} else {
			userServ.updateUser(editUser);;
			return "redirect:/account/" + userId;
		}
    	
    }
    
}