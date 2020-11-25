package net.spring.concurso.dao;
import java.util.List;
import net.spring.concurso.entity.Autor;

public interface AutorDAO {
	public void save(Autor bean);
	public void update(Autor bean);
	public void delete(int cod);
	public Autor findId(int cod);
	public List<Autor> listAll();
}
