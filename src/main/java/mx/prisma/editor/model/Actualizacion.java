package mx.prisma.editor.model;

// Generated 07-jun-2015 17:10:34 by Hibernate Tools 4.0.0

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import mx.prisma.admin.model.Colaborador;
import mx.prisma.admin.model.ColaboradorProyecto;

/**
 * Actualizacion generated by hbm2java
 */
@Entity
@Table(name = "Actualizacion", catalog = "PRISMA")
public class Actualizacion implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Date fecha;
	private String comentario;
	private Elemento elemento;
	private Colaborador colaborador;

	public Actualizacion() {
	}

	public Actualizacion(Date fecha, String comentario,
			Elemento elemento, Colaborador colaborador) {
		this.fecha = fecha;
		this.comentario = comentario;
		this.elemento = elemento;
		this.colaborador = colaborador;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", nullable = false, length = 10)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "comentario", nullable = false, length = 999)
	public String getComentario() {
		return this.comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Elementoid",referencedColumnName="id", nullable = false)
	public Elemento getElemento() {
		return elemento;
	}

	public void setElemento(Elemento elemento) {
		this.elemento = elemento;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ColaboradorCURP",referencedColumnName="CURP", nullable = false)
	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	

}
