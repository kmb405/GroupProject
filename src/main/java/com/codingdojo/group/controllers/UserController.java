package com.codingdojo.group.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.group.models.LoginUser;
import com.codingdojo.group.models.User;
import com.codingdojo.group.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {
    
    // Add once service is implemented:
     @Autowired
     private UserService userServ;
    
    
    
    @GetMapping("/login")
    public String login(@ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") LoginUser newLogin, HttpSession session) {
    	
    	return "loginPage.jsp";
    }
    
    @GetMapping("/register")
    public String register(@ModelAttribute("newUser") User newUser, HttpSession session) {
    	
    	return "registrationPage.jsp";
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
    
}