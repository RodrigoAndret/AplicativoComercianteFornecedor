package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante;
import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosComerciante;

public interface DadosComercianteRepository extends JpaRepository<DadosComerciante, Integer>{
	
	DadosComerciante findByComerciante(Comerciante comerciante);
}
