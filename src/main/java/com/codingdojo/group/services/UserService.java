package com.codingdojo.group.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.group.models.LoginUser;
import com.codingdojo.group.models.User;
import com.codingdojo.group.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public void createUser(User p) {
		userRepo.save(p);
	}
	
	public void updateUser(User p) {
		User oldUser = userRepo.findById(p.getId()).get();
		oldUser.setFirstName(p.getFirstName());
		oldUser.setLastName(p.getLastName());
		oldUser.setEmail(p.getEmail());
		oldUser.setAddress(p.getAddress());
		oldUser.setCity(p.getCity());
		oldUser.setState(p.getState());
		oldUser.setPassword(p.getPassword());
		userRepo.save(oldUser);
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
	
	
}
