package com.senac.grupo.AplicativoComercianteFornecedor.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "comerciante")
public class Comerciante {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	private String cnpj;
	
	
	
	private String senha;
	

	
	public Comerciante () {
		
	}
	
	
	public Comerciante(Integer idComerciante, String cnpjComerciante, String senhaComerciante) {
		super();
		this.id = idComerciante;
		this.cnpj = cnpjComerciante;
		this.senha = senhaComerciante;
	}

	public Integer getIdComerciante() {
		return id;
	}

	public void setIdComerciante(Integer idComerciante) {
		this.id = idComerciante;
	}


	public String getCnpjComerciante() {
		return cnpj;
	}

	public void setCnpjComerciante(String cnpjComerciante) {
		this.cnpj = cnpjComerciante;
	}

	public String getSenhaComerciante() {
		return senha;
	}

	public void setSenhaComerciante(String senhaComerciante) {
		this.senha = senhaComerciante;
	}

}
