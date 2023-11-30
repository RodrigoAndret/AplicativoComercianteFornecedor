package com.senac.grupo.AplicativoComercianteFornecedor.controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.senac.grupo.AplicativoComercianteFornecedor.model.Comerciante;
import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosComerciante;
import com.senac.grupo.AplicativoComercianteFornecedor.model.DadosFornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Fornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.model.Produto;
import com.senac.grupo.AplicativoComercianteFornecedor.model.ProdutoFornecedor;
import com.senac.grupo.AplicativoComercianteFornecedor.service.ComercianteService;
import com.senac.grupo.AplicativoComercianteFornecedor.service.DadosComercianteService;
import com.senac.grupo.AplicativoComercianteFornecedor.service.DadosFornecedorService;
import com.senac.grupo.AplicativoComercianteFornecedor.service.FornecedorService;
import com.senac.grupo.AplicativoComercianteFornecedor.service.ProdutoFornecedorService;
import com.senac.grupo.AplicativoComercianteFornecedor.service.ProdutoService;

import jakarta.servlet.http.HttpSession;

@Controller
public class Controlador {

	@Autowired
	ComercianteService comercianteDao;
	@Autowired
	DadosComercianteService dadosComercianteDao;
	@Autowired
	FornecedorService fornecedorDao;
	@Autowired
	DadosFornecedorService dadosFornecedorDao;
	@Autowired
	ProdutoService produtoDao;
	@Autowired
	ProdutoFornecedorService produtoFornecedorDao;

	@GetMapping("/")
	public String login() {
		return "index";
	}

	@GetMapping("/deslogar")
	public String deslogar(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@GetMapping("/erroLogin")
	public String erroLogin(@RequestParam("error") String erro, Model model) {

		switch (erro) {
		case "1":
			model.addAttribute("error", "1");
			return "login";
		case "2":
			model.addAttribute("error", "2");
			return "login";
		case "3":
			model.addAttribute("error", "3");
			return "login";
		case "4":
			model.addAttribute("error", "4");
			return "login";
		}

		return "login";
	}

	@GetMapping("cadastroComerciante")
	public String irCadastroComerciante() {
		return "cadastroComerciante";
	}

	@GetMapping("telaComerciante")
	public String irTelaComerciante() {
		return "telaComerciante";
	}

	@GetMapping("cadastroFornecedor")
	public String irCadastroFornecedor() {
		return "cadastroFornecedor";
	}

	@GetMapping("login")
	public String irLogin() {
		return "login";
	}

	@PostMapping("/cadastrarComerciante")
	public String cadastrarComerciante(DadosComerciante dadosComerciante, @RequestParam("cnpj") String cnpj,
			@RequestParam("senha") String senha, Model model) {

		Comerciante comercianteCnpj = new Comerciante();

		comercianteCnpj = comercianteDao.buscarComercianteCnpj(cnpj);
		if (comercianteCnpj == null) {

			Comerciante comerciante = new Comerciante();

			comerciante.setCnpjComerciante(cnpj);
			comerciante.setSenhaComerciante(senha);

			// session.setAttribute("comerciante",comerciante);

			System.out.println("tentando enviar pro BD");
			comercianteDao.salvarComerciante(comerciante);
			System.out.println("enviado pro BD com sucesso");

			dadosComerciante.setComerciante(comerciante);
			dadosComercianteDao.salvarDadosComerciante(dadosComerciante);
			return "/login";

		} else {
			System.out.println("cnpj já existente!");
			return "cadastroComerciante";
		}

	}

	@PostMapping("/cadastrarFornecedor")
	public String cadastrarComerciante(DadosFornecedor dadosFornecedor, @RequestParam("entrega") boolean entrega,
			@RequestParam("cnpj") String cnpj, @RequestParam("senha") String senha, Model model) {

		Fornecedor fornecedorCnpj = new Fornecedor();

		fornecedorCnpj = fornecedorDao.buscarFornecedorCnpj(cnpj);
		if (fornecedorCnpj == null) {

			Fornecedor fornecedor = new Fornecedor();

			fornecedor.setCnpjFornecedor(cnpj);
			fornecedor.setSenhaFornecedor(senha);

			System.out.println("tentando enviar pro BD");
			fornecedorDao.salvarFornecedor(fornecedor);
			System.out.println("enviado pro BD com sucesso");
			dadosFornecedor.setFornecedor(fornecedor);
			dadosFornecedorDao.salvarDadosFornecedor(dadosFornecedor);
			return "/login";

		} else {
			System.out.println("cnpj já existente!");
			return "cadastroFornecedor";
		}

	}

	@PostMapping("/login")
	public String fazerLogin(@RequestParam("cnpj") String cnpj, @RequestParam("senha") String senha,
			@RequestParam("opcoes") String opcoes, HttpSession session, Model model) {

		if (opcoes.equals("Comerciante")) {
			Comerciante comerciante = new Comerciante();
			comerciante = comercianteDao.buscarComercianteCnpj(cnpj);
			DadosComerciante dadosComerciante = new DadosComerciante();
			if (comerciante != null) {

				if ((comerciante.getCnpjComerciante().equals(cnpj))
						&& (comerciante.getSenhaComerciante().equals(senha))) {
					System.out.println("Certin");
					// session.setMaxInactiveInterval(500);
					session.setAttribute("Comerciante", comerciante);
					dadosComerciante = dadosComercianteDao.buscaDadosComerciantePorComerciante(comerciante);

					session.setAttribute("DadosComerciante", dadosComerciante);
					List<Produto> listaProdutos = produtoDao.listarTodosProdutos();
					model.addAttribute("listaTodosProdutos", listaProdutos);
					return "areaComerciante";
				} else {
					System.out.println("senha invalida");
					model.addAttribute("error", "2");
					return "login";
				}

			} else {
				System.out.println("cnpj invalido");
				model.addAttribute("error", "1");
				return "login";
			}
		} else if (opcoes.equals("Fornecedor")) {

			Fornecedor fornecedor = new Fornecedor();
			DadosFornecedor dadosFornecedor = new DadosFornecedor();
			fornecedor = fornecedorDao.buscarFornecedorCnpj(cnpj);
			if (fornecedor != null) {

				if ((fornecedor.getCnpjFornecedor().equals(cnpj)) && (fornecedor.getSenhaFornecedor().equals(senha))) {

					System.out.println("Entrou com sucesso");
					session.setMaxInactiveInterval(500);
					dadosFornecedor = dadosFornecedorDao.buscaDadosFornecedorPorFornecedor(fornecedor);
					session.setAttribute("DadosFornecedor", dadosFornecedor);
					session.setAttribute("Fornecedor", fornecedor);

					return "redirect:/listarProdutosFornecedor";
				} else {
					System.out.println("senha invalida");
					model.addAttribute("error", "1");
					return "login";
				}

			} else {
				System.out.println("cnpj invalido");
				model.addAttribute("error", "1");
				return "login";
			}
		} else {
			return "login";
		}
	}

	@GetMapping("/listarProdutosFornecedor")
	public String listarProdutosFornecedor(Model model, HttpSession session) {
		Fornecedor fornecedor = new Fornecedor();
		fornecedor = (Fornecedor) session.getAttribute("Fornecedor");
		List<ProdutoFornecedor> listaProdutosDoFornecedor = new ArrayList<>();
		listaProdutosDoFornecedor = produtoFornecedorDao.pesquisarProdutoFornecedorPeloFornecedor(fornecedor);
		model.addAttribute("ListaDeProdutosFornecedor", listaProdutosDoFornecedor);

		return "areaFornecedor";
	}

	@GetMapping("/excluirProduto")
	public String excluirProduto(@RequestParam("produtoId") Integer id) {

		produtoFornecedorDao.deletarProdutoFornecedor(id);
		return "redirect:/listarProdutosFornecedor";
	}

	@GetMapping("/editarProduto")
	public String editarProduto(@RequestParam("produtoId") Integer id, HttpSession session) {

//		ProdutoFornecedor produtoFornecedor = new ProdutoFornecedor();
//		produtoFornecedor = produtoFornecedorDao.buscarProdutoFornecedorPorId(id);
		session.setAttribute("ProdutoSelecionadoId", id);

		return "redirect:/listarProdutosFornecedor";
	}

	@GetMapping("/confirmarEdicaoProduto")
	@Transactional
	public String confirmarEdicaoProduto(@RequestParam("novoPreco") double novoPreco, HttpSession session) {
		Integer id = (Integer) session.getAttribute("ProdutoSelecionadoId");
		ProdutoFornecedor produto = produtoFornecedorDao.buscarProdutoFornecedorPorId(id);
		produto.setPreco(novoPreco);

		return "redirect:/listarProdutosFornecedor";
	}

	@PostMapping("/pesquisarProduto")
	public String pesquisarProdutoPeloNome(Model model, @RequestParam("pesquisaProduto") String id) {
		if (id != "") {
			Produto produtoPesquisado = produtoDao.pesquisarProdutoPorIdProduto(Integer.parseInt(id));
			List<ProdutoFornecedor> listaDeProdutoFornecedorDoProdutoPesquisado = new ArrayList<>();
			List<DadosFornecedor> listaDadosFornecedor = new ArrayList<>();
			DadosFornecedor dadosFornecedor = new DadosFornecedor();
			System.out.println(produtoPesquisado.toString());

			if (produtoPesquisado != null) {
				listaDeProdutoFornecedorDoProdutoPesquisado = produtoFornecedorDao
						.pesquisarProdutoFornecedorPeloProduto(produtoPesquisado);
				System.out.println(listaDeProdutoFornecedorDoProdutoPesquisado);
				model.addAttribute("ListaProdutoFornecedor", listaDeProdutoFornecedorDoProdutoPesquisado);
			}
			for (ProdutoFornecedor produtoFornecedor : listaDeProdutoFornecedorDoProdutoPesquisado) {
				dadosFornecedor = dadosFornecedorDao
						.buscaDadosFornecedorPorFornecedor(produtoFornecedor.getFornecedor());
				listaDadosFornecedor.add(dadosFornecedor);
			}
			model.addAttribute("ListaDadosFornecedor", listaDadosFornecedor);
			List<Produto> listaProdutos = produtoDao.listarTodosProdutos();
			model.addAttribute("listaTodosProdutos", listaProdutos);
			return "areaComerciante";
		}
		return "areaComerciante";

	}

	@GetMapping("/listarTodosProdutos")
	public String listarTodosOsProdutos(Model model) {
		List<Produto> listaProdutos = produtoDao.listarTodosProdutos();
		model.addAttribute("listaTodosProdutos", listaProdutos);
		return "novoProduto";
	}

	@PostMapping("/criarNovoTipoProduto")
	public String criarNovoTipoProduto(@RequestParam("novoTipoProduto") String nomeProduto) {

		if (nomeProduto != null) {
			Produto produto = new Produto();
			produto.setNomeProduto(nomeProduto);
			produtoDao.salvarProduto(produto);
		}
		return "redirect:/listarTodosProdutos";
	}

	@PostMapping("/registrarProduto")
	public String registrarProduto(@RequestParam("produtoSelecionado") String id,
			@RequestParam("precoProduto") Double preco, HttpSession session) {
		if (id != "") {
			Fornecedor fornecedor = (Fornecedor) session.getAttribute("Fornecedor");
			Produto produtoSelecionado = produtoDao.pesquisarProdutoPorIdProduto(Integer.parseInt(id));
			ProdutoFornecedor produtoFornecedor = new ProdutoFornecedor();
			produtoFornecedor.setFornecedor(fornecedor);
			produtoFornecedor.setProduto(produtoSelecionado);
			produtoFornecedor.setPreco(preco);
			produtoFornecedorDao.salvarProdutoFornecedor(produtoFornecedor);
		}
		return "redirect:/listarProdutosFornecedor";

	}

}
