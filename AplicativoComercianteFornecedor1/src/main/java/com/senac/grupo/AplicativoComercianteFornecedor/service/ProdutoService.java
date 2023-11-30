package com.senac.grupo.AplicativoComercianteFornecedor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.ProdutoRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Produto;

@Service
public class ProdutoService {
	
	@Autowired
	private ProdutoRepository produtoRepository;
	
	public Produto pesquisarProdutoPeloNome(String nomeProduto) {
		return produtoRepository.findBynomeProdutoContaining(nomeProduto);
	}
	
	public List<Produto> listarTodosProdutos() {
		return produtoRepository.findAll();
    }
	
	public Produto salvarProduto(Produto produto) {
        return produtoRepository.save(produto);
    }
	
	public Produto pesquisarProdutoPorIdProduto(Integer id) {
		return produtoRepository.findById(id).orElse(null);
	}
	
	
}
