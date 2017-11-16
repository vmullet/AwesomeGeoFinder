package com.company.agf.bean.entity;

import java.util.Date;

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
@Table(name="t_game")
public class GameDO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id")
	private Long id;
	
	@Column(name = "c_date", nullable = false)
	private Date date;
	
	@ManyToOne(cascade = { CascadeType.MERGE,CascadeType.REFRESH })
	@JoinColumn(name = "c_userId",nullable = false)
	private UserDO player;
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public UserDO getPlayer() {
		return player;
	}
	public void setPlayer(UserDO player) {
		this.player = player;
	}
	
	
	
}
