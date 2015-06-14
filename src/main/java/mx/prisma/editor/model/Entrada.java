package mx.prisma.editor.model;

/*
 * Sergio Ramírez Camacho 07/06/2015
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "Entrada", catalog = "PRISMA", uniqueConstraints = @UniqueConstraint(columnNames = {
		"CasoUsoElementoid", "Atributoid", "TerminoGlosarioElementoid" }))
public class Entrada implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int numeroToken;
	private TipoParametro tipoParametro;
	private CasoUso casoUso;
	private Atributo atributo;
	private TerminoGlosario terminoGlosario;

	public Entrada() {
	}

	public Entrada(int numeroToken, TipoParametro tipoParametro, CasoUso casoUso) {
		this.numeroToken = numeroToken;
		this.tipoParametro = tipoParametro;
		this.casoUso = casoUso;
	}

	public Entrada(int numeroToken, TipoParametro tipoParametro, CasoUso casoUso,
			Atributo atributo, TerminoGlosario terminoGlosario) {
		this.numeroToken = numeroToken;
		this.tipoParametro = tipoParametro;
		this.casoUso = casoUso;
		this.atributo = atributo;
		this.terminoGlosario = terminoGlosario;
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

	@Column(name = "numeroToken", nullable = false)
	public int getNumeroToken() {
		return this.numeroToken;
	}

	public void setNumeroToken(int numeroToken) {
		this.numeroToken = numeroToken;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "TipoParametroid", referencedColumnName = "id")
	public TipoParametro getTipoParametro() {
		return tipoParametro;
	}

	public void setTipoParametro(TipoParametro tipoParametro) {
		this.tipoParametro = tipoParametro;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CasoUsoElementoid", referencedColumnName = "Elementoid")
	public CasoUso getCasoUso() {
		return casoUso;
	}

	public void setCasoUso(CasoUso casoUso) {
		this.casoUso = casoUso;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "Atributoid", referencedColumnName = "id")
	public Atributo getAtributo() {
		return atributo;
	}

	public void setAtributo(Atributo atributo) {
		this.atributo = atributo;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "TerminoGlosarioElementoid", referencedColumnName = "Elementoid")
	public TerminoGlosario getTerminoGlosario() {
		return terminoGlosario;
	}

	public void setTerminoGlosario(TerminoGlosario terminoGlosario) {
		this.terminoGlosario = terminoGlosario;
	}

	

}
