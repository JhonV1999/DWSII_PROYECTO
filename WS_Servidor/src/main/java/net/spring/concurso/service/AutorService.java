package net.spring.concurso.service;
import java.util.List;

import net.spring.concurso.entity.Autor;

public interface AutorService {
	public void save(Autor bean);
	public void update(Autor bean);
	public void delete(int cod);
	public Autor findId(int cod);
	public List<Autor> listAll();
}
