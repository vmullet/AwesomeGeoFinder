package com.company.agf.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.company.agf.bean.entity.TurnDO;

public interface ITurnRepository extends JpaRepository<TurnDO,Long> {
		// Nothing here
}
