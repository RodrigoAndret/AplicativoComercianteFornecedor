package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Integer>{

	Produto findBynomeProdutoContaining(String nomeProduto);
	
}
