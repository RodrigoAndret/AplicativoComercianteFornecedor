package com.senac.grupo.AplicativoComercianteFornecedor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.DadosFornecedorRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;

@Service
public class DadosFornecedorService {
	
	@Autowired
    private DadosFornecedorRepository dadosFornecedorRepository;

    public DadosFornecedor salvarDadosFornecedor(DadosFornecedor fornecedor) {
        return dadosFornecedorRepository.save(fornecedor);
    }

    public List<DadosFornecedor> listarDadosFornecedor() {
    	return dadosFornecedorRepository.findAll();
    }

    public DadosFornecedor buscarDadosFornecedorPorId(Integer id) {
        return dadosFornecedorRepository.findById(id).orElse(null);
    }
    
    public DadosFornecedor  buscaDadosFornecedorPorFornecedor (Fornecedor fornecedor ) {
    	return dadosFornecedorRepository.findByFornecedor(fornecedor);
    }

    public void deletarDadosFornecedor(Integer id) {
    	dadosFornecedorRepository.deleteById(id);
    }

}
