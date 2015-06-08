package mx.prisma.editor.model;

// Generated 07-jun-2015 17:10:34 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import mx.prisma.admin.model.Proyecto;

/**
 * Entidad generated by hbm2java
 */
@Entity
@Table(name = "Entidad", catalog = "PRISMA")
@PrimaryKeyJoinColumn(name = "Elementoid", referencedColumnName = "id")

public class Entidad extends Elemento implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Set<Atributo> atributos = new HashSet<Atributo>(0);
	
	public Entidad(){
		
	}

	public Entidad(String clave, int numero, String nombre,
			Proyecto proyecto, String descripcion, EstadoElemento estadoElemento) {
		super(clave, numero, nombre, proyecto, descripcion, estadoElemento);

	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "entidad")
	public Set<Atributo> getAtributos() {
		return atributos;
	}

	public void setAtributos(Set<Atributo> atributos) {
		this.atributos = atributos;
	}

}
