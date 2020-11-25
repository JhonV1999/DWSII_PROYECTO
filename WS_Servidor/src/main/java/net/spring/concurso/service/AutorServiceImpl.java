package net.spring.concurso.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.spring.concurso.dao.AutorDAO;
import net.spring.concurso.entity.Autor;

@Service
public class AutorServiceImpl implements AutorService{
	@Autowired
	private AutorDAO autorDAO;
	
	@Override
	public void save(Autor bean) {
		autorDAO.save(bean);
	}
	
	@Override
	public void update(Autor bean) {
		autorDAO.update(bean);
	}
	@Override
	public void delete(int cod) {
		autorDAO.delete(cod);
		
	}

	@Override
	public Autor findId(int cod) {
		return autorDAO.findId(cod);
	}

	@Override
	public List<Autor> listAll() {
		return autorDAO.listAll();
	}


}
