package com.company.agf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.agf.bean.entity.HelloDO;
import com.company.agf.repository.IHelloRepository;

/**
 * Classic BO Layer
 * 
 * @author mxd
 *
 */
@RestController
@RequestMapping(value = "/hello")
@Transactional
public class HelloService {

	@Autowired
	private IHelloRepository repository;

	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public List<HelloDO> findAll() {
		return repository.findAll();
	}

}
