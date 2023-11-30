package com.senac.grupo.AplicativoComercianteFornecedor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.ProdutoFornecedorRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Produto;
import com.senac.grupo.AplicativoComercianteFornecedor.model.ProdutoFornecedor;

@Service
public class ProdutoFornecedorService {

	@Autowired
	private ProdutoFornecedorRepository produtoFornecedorRepository;
	
	public List<ProdutoFornecedor> pesquisarProdutoFornecedorPeloProduto (Produto produto) {
		return produtoFornecedorRepository.findByProduto(produto);
	}
	
	public List<ProdutoFornecedor> pesquisarProdutoFornecedorPeloFornecedor (Fornecedor fornecedor){
		return produtoFornecedorRepository.findByFornecedor(fornecedor);
	}
	
	public ProdutoFornecedor buscarProdutoFornecedorPorId(Integer id) {
		return produtoFornecedorRepository.findById(id).orElse(null);
	}
	
	public void deletarProdutoFornecedor(Integer id) {
		produtoFornecedorRepository.deleteById(id);
	}
	
	public ProdutoFornecedor salvarProdutoFornecedor(ProdutoFornecedor produtoFornecedor) {
        return produtoFornecedorRepository.save(produtoFornecedor);
    }
	
}
