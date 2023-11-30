package com.senac.grupo.AplicativoComercianteFornecedor.dao;

import org.springframework.data.jpa.repository.JpaRepository;


import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;

public interface DadosFornecedorRepository extends JpaRepository<DadosFornecedor,Integer>{
	
	DadosFornecedor findByFornecedor(Fornecedor fornecedor);

}
