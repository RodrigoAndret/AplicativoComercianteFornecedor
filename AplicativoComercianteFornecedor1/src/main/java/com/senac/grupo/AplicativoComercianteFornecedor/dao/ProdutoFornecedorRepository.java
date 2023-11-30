package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Produto;
import com.senac.grupo.AplicativoComercianteFornecedor.model.ProdutoFornecedor;

public interface ProdutoFornecedorRepository extends JpaRepository<ProdutoFornecedor, Integer>{
	
	
	List<ProdutoFornecedor> findByProduto (Produto produto);
	List<ProdutoFornecedor> findByFornecedor (Fornecedor fornecedor);
}
