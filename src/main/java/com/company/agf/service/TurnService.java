package com.company.agf.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.agf.bean.entity.CapitalDO;
import com.company.agf.bean.entity.GameDO;
import com.company.agf.bean.entity.TurnDO;
import com.company.agf.repository.ITurnRepository;

@RestController
@RequestMapping(value = "/turn")
@Transactional
public class TurnService {

	@Autowired
	private ITurnRepository repository;
	
	private static final ExampleMatcher GAME_ID_MATCHER = ExampleMatcher.matching()
			.withIgnorePaths("score")
			.withIgnorePaths("help")
			.withMatcher("game.id", GenericPropertyMatchers.ignoreCase());
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST,
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces="application/json")
	public TurnDO add(@RequestBody TurnDO turn) {
		return repository.save(turn);
	}
	
	/**
	 * Classic CRUD
	 * @return
	 */
	@RequestMapping(value="/all/{gameId}",method = RequestMethod.GET,
			produces="application/json")
	public List<TurnDO> findAll(@PathVariable long gameId) {
		TurnDO turn = new TurnDO();
		GameDO game = new GameDO();
		game.setId(gameId);
		turn.setGame(game);
		
		Example<TurnDO> example = Example.<TurnDO>of(turn, GAME_ID_MATCHER);
		return repository.findAll(example);
	}
	
}
