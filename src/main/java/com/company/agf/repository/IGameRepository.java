package com.company.agf.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.company.agf.bean.entity.GameDO;

@Transactional(propagation = Propagation.MANDATORY)
public interface IGameRepository extends JpaRepository<GameDO,Long> {
			// Nothing here
}
