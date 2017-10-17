package com.company.agf.bean.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classic entity bean
 * @author mxd
 *
 */
@Entity
@Table(name = "t_hello")
public class HelloDO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "c_id")
	private Long id;

	@Column(name = "c_personne", nullable = false)
	private String personne;

	@Column(name = "c_message", nullable = false)
	private String message;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(final Long id) {
		this.id = id;
	}

	/**
	 * @return the personne
	 */
	public String getPersonne() {
		return personne;
	}

	/**
	 * @param personne
	 *            the personne to set
	 */
	public void setPersonne(final String personne) {
		this.personne = personne;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(final String message) {
		this.message = message;
	}

}
