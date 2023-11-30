package com.senac.grupo.AplicativoComercianteFornecedor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.senac.grupo.AplicativoComercianteFornecedor.dao.DadosComercianteRepository;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante;
import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosComerciante;

@Service
public class DadosComercianteService {
	
	@Autowired
    private DadosComercianteRepository dadosComercianteRepository;

    public DadosComerciante salvarDadosComerciante(DadosComerciante dadosComerciante) {
        return dadosComercianteRepository.save(dadosComerciante);
    }

    public List<DadosComerciante> listarDadosComerciante() {
        return dadosComercianteRepository.findAll();
    }

    public DadosComerciante buscarDadosComerciantePorId(Integer id) {
        return dadosComercianteRepository.findById(id).orElse(null);
    }

    public DadosComerciante buscaDadosComerciantePorComerciante(Comerciante comerciante) {
    	return dadosComercianteRepository.findByComerciante(comerciante);
    }
    
    public void deletarDadosComerciante(Integer id) {
    	dadosComercianteRepository.deleteById(id);
    }

}
