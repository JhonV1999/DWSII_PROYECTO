package net.spring.concurso.entity;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="pais")
public class Pais implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idPais")
	private int idPais;
	@Column(name = "iso")
	private String iso;
	@Column(name = "nombre")
	private String nombre;
	
	@JsonIgnore
	//relación uno "Marca" a muchos "Computadora"
	@OneToMany(mappedBy = "pais")
	private List<Autor> listaAutores;

	public int getIdPais() {
		return idPais;
	}

	public void setIdPais(int idPais) {
		this.idPais = idPais;
	}

	public String getIso() {
		return iso;
	}

	public void setIso(String iso) {
		this.iso = iso;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Autor> getListaAutores() {
		return listaAutores;
	}

	public void setListaAutores(List<Autor> listaAutores) {
		this.listaAutores = listaAutores;
	}

	

	
	
	
}
