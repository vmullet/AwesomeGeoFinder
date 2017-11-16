package com.company.agf.bean.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_turn")
public class TurnDO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id")
	private Long id;
	
	@Column(name = "c_score", nullable = false)
	private int score;
	
	@Column(name = "c_help", nullable = false)
	private boolean help;
	
	@ManyToOne(cascade = { CascadeType.MERGE,CascadeType.REFRESH })
	@JoinColumn(name = "c_gameId" , nullable = false)
	private GameDO game;
	
	@ManyToOne(cascade = { CascadeType.MERGE,CascadeType.REFRESH })
	@JoinColumn(name = "c_capitalId", nullable = false)
	private CapitalDO city;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public boolean isHelp() {
		return help;
	}
	public void setHelp(boolean help) {
		this.help = help;
	}
	public GameDO getGame() {
		return game;
	}
	public void setGame(GameDO game) {
		this.game = game;
	}
	public CapitalDO getCity() {
		return city;
	}
	public void setCity(CapitalDO city) {
		this.city = city;
	}
	
	
	
}
