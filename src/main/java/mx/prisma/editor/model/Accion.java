package mx.prisma.editor.model;

// Generated 07-jun-2015 17:10:34 by Hibernate Tools 4.0.0

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Accion generated by hbm2java
 */
@Entity
@Table(name = "Accion", catalog = "PRISMA", uniqueConstraints = @UniqueConstraint(columnNames = {
		"PantallaElementoid", "nombre" }))
public class Accion implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Pantalla pantalla;
	private String nombre;
	private TipoAccion tipoAccion;
	private Pantalla pantallaDestino;
	private String descripcion;
	private byte[] imagen; 

	public Accion() {
	}

	public Accion(Pantalla pantalla, String nombre,
			TipoAccion tipoAccion) {
		this.pantalla = pantalla;
		this.nombre = nombre;
		this.tipoAccion = tipoAccion;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PantallaElementoid", referencedColumnName = "Elementoid")
	public Pantalla getPantalla() {
		return pantalla;
	}

	public void setPantalla(Pantalla pantalla) {
		this.pantalla = pantalla;
	}
	
	@Column(name = "nombre", nullable = false, length = 45)
	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "TipoAccionid", referencedColumnName = "id")
	public TipoAccion getTipoAccion() {
		return tipoAccion;
	}

	public void setTipoAccion(TipoAccion tipoAccion) {
		this.tipoAccion = tipoAccion;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PantallaElementoidDestino", referencedColumnName = "Elementoid")
	public Pantalla getPantallaDestino() {
		return pantallaDestino;
	}

	public void setPantallaDestino(Pantalla pantallaDestino) {
		this.pantallaDestino = pantallaDestino;
	}

	@Column(name = "descripcion", nullable = false, length = 999)
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Column(name = "imagen", length = 999)
	public byte[] getImagen() {
		return this.imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}
	
}
