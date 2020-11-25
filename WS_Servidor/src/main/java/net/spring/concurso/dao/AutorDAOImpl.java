package net.spring.concurso.dao;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import net.spring.concurso.entity.Autor;

@Repository
public class AutorDAOImpl implements AutorDAO{
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	@Override
	public void save(Autor bean) {
		Session session=factory.getCurrentSession();
		try {
			session.save(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	@Override
	public void update(Autor bean) {
		Session session=factory.getCurrentSession();
		try {
			session.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	@Transactional
	@Override
	public void delete(int cod) {
		Session session=factory.getCurrentSession();
		try {
			Autor bean=session.get(Autor.class, cod);
			session.delete(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Transactional(readOnly = true)
	@Override
	public Autor findId(int cod) {
		Autor bean=null;
		Session session=factory.getCurrentSession();
		try {
			bean=session.get(Autor.class, cod);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Autor> listAll() {
		List<Autor> lista=null;
		Query query=null;
		Session session=factory.getCurrentSession();
		try {
			String hql="select a from Autor a";
			query=session.createQuery(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query.getResultList();
	}
	
	

}
