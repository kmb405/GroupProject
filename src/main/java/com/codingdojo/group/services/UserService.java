package com.codingdojo.group.services;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.group.models.LoginUser;
import com.codingdojo.group.models.Pizza;
import com.codingdojo.group.models.User;
import com.codingdojo.group.repositories.PizzaRepository;
import com.codingdojo.group.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;

	@Autowired
	private PizzaRepository pizzaRepo;

	
	public void createUser(User p) {
		userRepo.save(p);
	}
	
	public void updateUser(User p) {
		userRepo.save(p);
	}
	
	public User findById(Long id) {
		Optional<User> thisUser = userRepo.findById(id);
		if (thisUser.isPresent()) {
			return thisUser.get();
		} else {
			return null;
		}
	}
	
	public List<User> getAll() {
		return userRepo.findAll();
	}
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> existingUser = userRepo.findByEmail(newUser.getEmail());
		if(existingUser.isPresent()) {
			result.rejectValue("email", "Matches", "The email is already in use");
			
		}
		
		if(!newUser.getConfirm().equals(newUser.getPassword())) {
			result.rejectValue("confirm", "Matches", "The Comfirm Passord doesn't match.");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		
		newUser.setPassword(hashed);
		
		userRepo.save(newUser);
		return newUser;
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
		if(potentialUser.isEmpty()) {
			result.rejectValue("email", "Exists", "No user found with this email");
		}
		
		if(potentialUser.isPresent()) {
			if(!BCrypt.checkpw(newLogin.getPassword(), potentialUser.get().getPassword())) {
			    result.rejectValue("password", "Matches", "Invalid Password!");
			}
		}
		
		if(result.hasErrors()) {
			return null;			
		}
		
		return potentialUser.get();
		
	}
	
	public void addPizzaToUserFavorites(Long userId, Long pizzaId) {

        User user = userRepo.findById(userId).orElseThrow();
        Pizza pizza = pizzaRepo.findById(pizzaId).orElseThrow();
        
        user.getFavoritePizzas().add(pizza);
        userRepo.save(user);
    }
    
    public Set<Pizza> getUserFavoritePizzas(Long userId) {
        User user = userRepo.findById(userId).orElseThrow();
        return user.getFavoritePizzas();
    }

	
	
}
