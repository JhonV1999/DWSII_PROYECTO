package net.spring.concurso.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.spring.concurso.entity.Autor;
import net.spring.concurso.entity.Pais;
import net.spring.concurso.service.AutorService;
import net.spring.concurso.service.PaisService;

@RestController
@RequestMapping(value = "/autor")
public class AutorController {
	
	@Autowired
	private AutorService autorService;
	
	@Autowired
	private PaisService paisService;

	//select pais > a una fila
	@GetMapping(path = "/listAllPais")
	@ResponseBody
	public List<Pais> listAllPais(){
		return paisService.listAll();
	}
	//select autor > a una fila
	@GetMapping(path = "/listAllAutor")
	@ResponseBody
	public List<Autor> listAllAutor(){
		return autorService.listAll();
	}	
	//select autor una fila
	@GetMapping(path = "/findAutor/{codigo}")
	@ResponseBody
	public Autor findAutor(@PathVariable("codigo") int cod){
		return autorService.findId(cod);
	}
	//insert
	@PostMapping(path = "/saveAutor")
	public void saveAutor(@RequestBody Autor bean) {
		autorService.save(bean);
	}
	//update
	@PutMapping(path = "/updateAutor")
	public void updateAutor(@RequestBody Autor bean) {
		autorService.update(bean);
	}	
	//delete
	@DeleteMapping(path = "/deleteAutor/{codigo}")
	public void deleteAutor(@PathVariable("codigo") int cod){
		autorService.delete(cod);
	}
	
}





