package com.company.agf.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.agf.bean.entity.CapitalDO;
import com.company.agf.repository.ICapitalRepository;

/**
 * Classic BO layer
 * @author Valentin
 *
 */
@RestController
@RequestMapping(value = "/capital")
@Transactional
public class CapitalService {

	public static final int RANDOM_GENERATED = 10;
	
	@Autowired
	private ICapitalRepository repository;
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public List<CapitalDO> findAll() {
		return repository.findAll();
	}
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(value="/random",method = RequestMethod.GET)
	@Transactional
	public List<CapitalDO> getRandomList() {
		List<CapitalDO> cdo = new ArrayList<CapitalDO>();
		Long total = repository.count();
		if (total > 0) {
			Random r = new Random();
			for (int i = 0 ; i < RANDOM_GENERATED ; i++) {
				long randomIndex = 1+((long)(r.nextDouble() * (total-1)));
				cdo.add(repository.findOne(randomIndex));
			}
		}
		
		return cdo;
	}
	
}
