package com.company.agf.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.company.agf.bean.entity.HelloDO;


/**
 * Repository for {@link HelloDO}
 * @author MaxD
 *
 */
@Transactional(propagation = Propagation.MANDATORY)
public interface IHelloRepository extends JpaRepository<HelloDO, Long> {
	// Nothing here. 
}
