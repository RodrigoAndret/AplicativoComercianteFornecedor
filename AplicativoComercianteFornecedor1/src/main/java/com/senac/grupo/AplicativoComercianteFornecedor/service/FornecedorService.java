package com.senac.grupo.AplicativoComercianteFornecedor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.FornecedorRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;

@Service
public class FornecedorService {
	
	@Autowired
    private FornecedorRepository FornecedorRepository;

    public Fornecedor salvarFornecedor(Fornecedor fornecedor) {
        return FornecedorRepository.save(fornecedor);
    }
    
    
    public Fornecedor buscarFornecedorCnpj(String cnpj) {
        return FornecedorRepository.findBycnpj(cnpj);
    }
    
    
    
}
