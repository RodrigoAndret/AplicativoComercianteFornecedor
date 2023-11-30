package com.senac.grupo.AplicativoComercianteFornecedor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.ComercianteRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante;

@Service
public class ComercianteService {
	
	@Autowired
    private ComercianteRepository ComercianteRepository;

    public Comerciante salvarComerciante(Comerciante comerciante) {
        return ComercianteRepository.save(comerciante);
    }
    
    
    public Comerciante buscarComercianteCnpj(String cnpj) {
        return ComercianteRepository.findBycnpj(cnpj);
    }
    
    
    
}
