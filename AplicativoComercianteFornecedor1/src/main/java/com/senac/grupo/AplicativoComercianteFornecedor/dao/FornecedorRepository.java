package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;

public interface FornecedorRepository extends JpaRepository<Fornecedor,Integer>{
	
	Fornecedor findBycnpj(String cnpj);

}
