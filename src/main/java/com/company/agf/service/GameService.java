package com.company.agf.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.agf.bean.entity.GameDO;
import com.company.agf.bean.entity.UserDO;
import com.company.agf.repository.IGameRepository;

@RestController
@RequestMapping(value = "/game")
@Transactional
public class GameService {

	@Autowired
	private IGameRepository repository;
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces="application/json")
	public GameDO add(@RequestBody UserDO player) {
		GameDO game = new GameDO();
		game.setDate(new Date());
		game.setPlayer(player);
		return repository.save(game);
	}
	
}
