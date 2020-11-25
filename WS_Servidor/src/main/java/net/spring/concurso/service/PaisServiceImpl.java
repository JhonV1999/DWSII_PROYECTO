package net.spring.concurso.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import net.spring.concurso.dao.PaisDAO;
import net.spring.concurso.entity.Pais;

@Service
public class PaisServiceImpl implements PaisService{
	
	@Autowired
	private PaisDAO paisDAO;


	@Override
	public List<Pais> listAll() {
		return paisDAO.listAll();
	}


}
