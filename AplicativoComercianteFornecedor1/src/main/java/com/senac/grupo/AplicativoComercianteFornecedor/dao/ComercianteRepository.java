package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante;

public interface ComercianteRepository extends JpaRepository<Comerciante, Integer>{ 
	
	Comerciante findBycnpj(String cnpj);
	
	

}
