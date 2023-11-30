package com.senac.grupo.AplicativoComercianteFornecedor.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "fornecedor")
public class Fornecedor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String cnpj;
	private String senha;
	

	
	public Fornecedor () {
		
	}
	
	
	public Fornecedor(Integer idFornecedor, String cnpjFornecedor, String senhaFornecedor) {
		super();
		this.id = idFornecedor;
		this.cnpj = cnpjFornecedor;
		this.senha = senhaFornecedor;
	}

	public Integer getIdFornecedor() {
		return id;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.id = idFornecedor;
	}

	public String getCnpjFornecedor() {
		return cnpj;
	}

	public void setCnpjFornecedor(String cnpjFornecedor) {
		this.cnpj = cnpjFornecedor;
	}

	public String getSenhaFornecedor() {
		return senha;
	}

	public void setSenhaFornecedor(String senhaFornecedor) {
		this.senha = senhaFornecedor;
	}
	
	

}
