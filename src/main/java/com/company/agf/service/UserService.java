package com.company.agf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.agf.bean.entity.UserDO;
import com.company.agf.repository.IUserRepository;

/**
 * Classic BO Layer
 * 
 * @author Valentin
 *
 */
@RestController
@RequestMapping(value = "/user")
@Transactional
public class UserService {

	public static final String LOGIN_ATTRIBUTE = "login";
	public static final String PASSWORD_ATTRIBUTE = "password";
	
	private static final ExampleMatcher LOGIN_PASSWORD_MATCHER = ExampleMatcher.matching()
			.withMatcher(LOGIN_ATTRIBUTE, GenericPropertyMatchers.ignoreCase())
			.withMatcher(PASSWORD_ATTRIBUTE, GenericPropertyMatchers.ignoreCase());
	
	@Autowired
	private IUserRepository repository;
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public List<UserDO> findAll() {
		return repository.findAll();
	}
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST
			,consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE
			,produces="application/json")
	public UserDO add(UserDO user) {
		return repository.save(user);
	}
	
	
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(value="/login",method = RequestMethod.POST
			,consumes=MediaType.APPLICATION_FORM_URLENCODED_VALUE
			,produces="application/json")
	public UserDO login(UserDO user) {
		Example<UserDO> example = Example.<UserDO>of(user, LOGIN_PASSWORD_MATCHER);
		UserDO result = repository.findOne(example);
		if (result == null) {
			return new UserDO();
		} else {
			return result;
		}
		
	}
	
	
	
}
