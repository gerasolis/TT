package mx.prisma.editor.model;

// Generated 07-jun-2015 17:10:34 by Hibernate Tools 4.0.0

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * CasoUsoReglaNegocioId generated by hbm2java
 */
@Embeddable
public class CasoUsoReglaNegocioId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CasoUso casoUso;
	private ReglaNegocio reglaNegocio;

	public CasoUsoReglaNegocioId() {
	}

	public CasoUsoReglaNegocioId(CasoUso casoUso, ReglaNegocio reglaNegocio) {
		this.casoUso = casoUso;
		this.reglaNegocio = reglaNegocio;
	}
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "CasoUsoElementoid", referencedColumnName = "Elementoid")
	public CasoUso getCasoUso() {
		return casoUso;
	}

	public void setCasoUso(CasoUso casoUso) {
		this.casoUso = casoUso;
	}

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "ReglaNegocioElementoid", referencedColumnName = "Elementoid")
	public ReglaNegocio getReglaNegocio() {
		return reglaNegocio;
	}

	public void setReglaNegocio(ReglaNegocio reglaNegocio) {
		this.reglaNegocio = reglaNegocio;
	}
	

}
