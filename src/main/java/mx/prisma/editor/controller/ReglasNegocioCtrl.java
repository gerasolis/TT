package mx.prisma.editor.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import mx.prisma.admin.model.Proyecto;
import mx.prisma.editor.bs.ElementoBs;
import mx.prisma.editor.bs.EntidadBs;
import mx.prisma.editor.bs.ReglaNegocioBs;
import mx.prisma.editor.model.Atributo;
import mx.prisma.editor.model.Entidad;
import mx.prisma.editor.model.Operador;
import mx.prisma.editor.model.ReglaNegocio;
import mx.prisma.editor.model.TipoReglaNegocio;
import mx.prisma.util.ActionSupportPRISMA;
import mx.prisma.util.ErrorManager;
import mx.prisma.util.PRISMAException;
import mx.prisma.util.PRISMAValidacionException;
import mx.prisma.util.SessionManager;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ModelDriven;

@ResultPath("/content/editor/")
@Results({ @Result(name = ActionSupportPRISMA.SUCCESS, type = "redirectAction", params = {
		"actionName", "reglas-negocio"}),
		@Result(name = "atributos", type = "json", params = {
				"root",
				"listAtributos" }),
		@Result(name = "entidades", type = "json", params = {
				"root",
				"listEntidades"}),
		@Result(name = "operadores", type = "json", params = {
				"root",
				"listOperadores"})
})
public class ReglasNegocioCtrl extends ActionSupportPRISMA implements ModelDriven<ReglaNegocio>, SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Proyecto proyecto;
	private ReglaNegocio model;
	private List<ReglaNegocio> listReglasNegocio;
	private List<TipoReglaNegocio> listTipoRN;
	private int idTipoRN;
	private String jsonAtributos;
	private String jsonEntidades;
	private List<Entidad> listEntidades;
	private List<Atributo> listAtributos;
	private List<Operador> listOperadores;
	
	private int idAtributo;
	private int idEntidad;
	
	private int idEntidadUnicidad;
	private int idAtributoUnicidad;
	
	private int idAtributoFormato;
	
	private int idAtributoFI;
	private int idAtributoFT;
	
	private int idAtributo1;
	private int idAtributo2;
	private int idOperador;
	
	private Integer idSel;
	
	
	
	public String index() {
		try {
			//Se consulta el proyecto activo
			proyecto = SessionManager.consultarProyectoActivo();
			model.setProyecto(proyecto);
			listReglasNegocio = ReglaNegocioBs.consultarReglasNegocioProyecto(proyecto);
			
			@SuppressWarnings("unchecked")
			Collection<String> msjs = (Collection<String>) SessionManager.get("mensajesAccion");
			this.setActionMessages(msjs);
			SessionManager.delete("mensajesAccion");
			
		} catch (PRISMAException pe) {
			ErrorManager.agregaMensajeError(this, pe);
		} catch (Exception e) {
			ErrorManager.agregaMensajeError(this, e);
		}
		return INDEX;
	}
	
	public String editNew() {
		String resultado = null;
		try {
			
			// Creación del modelo
			proyecto = SessionManager.consultarProyectoActivo();
			buscaCatalogos();
			buscarEntidades();
			model.setClave("RN");
			resultado = EDITNEW;
		} catch (PRISMAValidacionException pve) {
			ErrorManager.agregaMensajeError(this, pve);
			resultado = editNew();
		} catch (PRISMAException pe) {
			ErrorManager.agregaMensajeError(this, pe);
			resultado = index();
		} catch (Exception e) {
			ErrorManager.agregaMensajeError(this, e);
			resultado = index();
		}

		return resultado;
	}

	private void buscarEntidades() {
		this.listAtributos = new ArrayList<Atributo>();
		this.listEntidades = new ArrayList<Entidad>();
		
	}

	public String create() {
		String resultado = null;
		try {
			if(idTipoRN == -1) {
				throw new PRISMAValidacionException("El usuario no seleccionó el tipo de regla de negocio.", "MSG4", null, "idTipoRN");
			}
			model.setTipoReglaNegocio(ReglaNegocioBs.consultaTipoReglaNegocio(idTipoRN));
			
			String tipoRN = model.getTipoReglaNegocio().getNombre();
			if(tipoRN.equals(ReglaNegocioBs.getCompatributos())) {
				model = ReglaNegocioBs.agregarElementosComparacion(model, idAtributo1, idOperador, idAtributo2);
			} else if(tipoRN.equals(ReglaNegocioBs.getUnicidad())) {
				model = ReglaNegocioBs.agregarElementosUnicidad(model, idEntidadUnicidad, idAtributoUnicidad);
			} else if(tipoRN.equals(ReglaNegocioBs.getFormatocampo())) {
				model = ReglaNegocioBs.agregarElementosFormatoCampo(model, idAtributoFormato);
			} else if(tipoRN.equals("-1")){
				throw new PRISMAValidacionException("El usuario no seleccionó el tipo de regla de negocio.", "MSG13");
			}
			//Se prepara el modelo para el registro 
			proyecto = SessionManager.consultarProyectoActivo();
			model.setProyecto(proyecto);
			model.setEstadoElemento(ElementoBs.consultarEstadoElemento(ElementoBs.getIDEstadoEdicion()));
			
			//Se registra el mensaje
			ReglaNegocioBs.registrarReglaNegocio(model);
			resultado = SUCCESS;
			
			//Se agrega mensaje de éxito
			addActionMessage(getText("MSG1", new String[] { "La",
					"Regla de negocio", "registrada" }));
			
			//Se agrega el mensaje a la sesión
			SessionManager.set(this.getActionMessages(), "mensajesAccion");
			
		} catch (PRISMAValidacionException pve) {
			ErrorManager.agregaMensajeError(this, pve);
			resultado = editNew();
		} catch (PRISMAException pe) {
			ErrorManager.agregaMensajeError(this, pe);
			resultado = index();
		} catch (Exception e) {
			ErrorManager.agregaMensajeError(this, e);
			resultado = index();
		}
		return resultado;
	}
	
	public String show() throws Exception{
		String resultado = null;
		try {
			model = ReglaNegocioBs.consultaReglaNegocio(idSel);			
			resultado = SHOW;
		} catch (PRISMAException pe) {
			pe.setIdMensaje("MSG26");
			ErrorManager.agregaMensajeError(this, pe);
			return index();
		} catch(Exception e) {
			ErrorManager.agregaMensajeError(this, e);
			return index();
		}
		return resultado;
	}
	
	public String cargarEntidades() {
		try {
			proyecto = SessionManager.consultarProyectoActivo();
			
			System.out.println("tipo RN desde cargarEntidades: " + this.idTipoRN);
			String tipoRN = ReglaNegocioBs.consultaTipoReglaNegocio(idTipoRN).getNombre();
			System.out.println("TipoRN desde cargarEntidades: " + tipoRN);
			listEntidades = EntidadBs.consultarEntidadesProyecto(proyecto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "entidades";
	}
	
	public String cargarEntidadesDependientes() {
		try {
			proyecto = SessionManager.consultarProyectoActivo();
			Atributo atributo = EntidadBs.consultarAtributo(this.idAtributo);
			listEntidades = ReglaNegocioBs.consultarEntidadesTipoDato(proyecto, atributo.getTipoDato().getNombre());
			System.out.println("size entidades desde cargarEntidadesDependientes: " + listEntidades.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "entidades";
	}
	
	public String cargarAtributos() {
		try {
			Entidad entidad = EntidadBs.consultarEntidad(this.idEntidad);
			this.listAtributos = new ArrayList<Atributo>(entidad.getAtributos());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "atributos";
	}
	
	public String cargarAtributosDependientes() {
		System.out.println("desde cargar atributos dependientes");
		try {
			Atributo atributo = EntidadBs.consultarAtributo(this.idAtributo);
			String tipoDato = atributo.getTipoDato().getNombre();
			listAtributos = ReglaNegocioBs.consultarAtributosTipoDato(idEntidad, tipoDato);
			System.out.println("size listAtributos desde cargarAtributosDependientes: " + listAtributos.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "atributos";
	}
	
	public String cargarEntidadesFecha() {
		try {
			proyecto = SessionManager.consultarProyectoActivo();
			
			System.out.println("tipo RN desde cargarEntidadesFecha: " + this.idTipoRN);
			String tipoRN = ReglaNegocioBs.consultaTipoReglaNegocio(idTipoRN).getNombre();
			System.out.println("TipoRN: " + tipoRN);
			listEntidades = EntidadBs.consultarEntidadesProyectoConFecha(proyecto);
			System.out.println("size fecha: " + listEntidades.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "entidades";
	}
	
	public String cargarAtributosFecha() {
		try {
			System.out.println("tipo RN desde cargarAtributosFecha: " + this.idTipoRN);
			this.listAtributos = EntidadBs.consultarAtributosTipoFecha(this.idEntidad);
			
			System.out.println("size atr: " + listAtributos.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "atributos";
	}
	
	public String cargarOperadores() {
		try {
			Atributo atributo = EntidadBs.consultarAtributo(this.idAtributo);
			listOperadores = ReglaNegocioBs.consultarOperadoresDisponibles(atributo.getTipoDato().getNombre());
			System.out.println("size oper: " + listOperadores.size());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "operadores";
	}

	private void buscaCatalogos() { 
		listTipoRN = ReglaNegocioBs.consultarTipoRNDisponibles(proyecto);
		listOperadores = new ArrayList<Operador>();
	}

	public void setSession(Map<String, Object> session) {		
	}

	public ReglaNegocio getModel() {
		if(model == null) {
			model = new ReglaNegocio();
		}
		return model;
	}

	public List<ReglaNegocio> getListReglasNegocio() {
		return listReglasNegocio;
	}

	public void setListReglasNegocio(List<ReglaNegocio> listReglasNegocio) {
		this.listReglasNegocio = listReglasNegocio;
	}

	public List<TipoReglaNegocio> getListTipoRN() {
		return listTipoRN;
	}

	public void setListTipoRN(List<TipoReglaNegocio> listTipoRN) {
		this.listTipoRN = listTipoRN;
	}

	public void setModel(ReglaNegocio model) {
		this.model = model;
	}

	public int getIdTipoRN() {
		return idTipoRN;
	}

	public void setIdTipoRN(int idTipoRN) {
		this.idTipoRN = idTipoRN;
	}

	public int getIdEntidad() {
		return idEntidad;
	}

	public void setIdEntidad(int idEntidad) {
		this.idEntidad = idEntidad;
	}

	public String getJsonAtributos() {
		return jsonAtributos;
	}

	public void setJsonAtributos(String jsonAtributos) {
		this.jsonAtributos = jsonAtributos;
	}

	public String getJsonEntidades() {
		return jsonEntidades;
	}

	public void setJsonEntidades(String jsonEntidades) {
		this.jsonEntidades = jsonEntidades;
	}

	public List<Entidad> getListEntidades() {
		return listEntidades;
	}

	public void setListEntidades(List<Entidad> listEntidades) {
		this.listEntidades = listEntidades;
	}

	public List<Atributo> getListAtributos() {
		return listAtributos;
	}

	public void setListAtributos(List<Atributo> listAtributos) {
		this.listAtributos = listAtributos;
	}

	public List<Operador> getListOperadores() {
		return listOperadores;
	}

	public void setListOperadores(List<Operador> listOperadores) {
		this.listOperadores = listOperadores;
	}

	public int getIdEntidadUnicidad() {
		return idEntidadUnicidad;
	}

	public void setIdEntidadUnicidad(int idEntidadUnicidad) {
		this.idEntidadUnicidad = idEntidadUnicidad;
	}

	public int getIdAtributoUnicidad() {
		return idAtributoUnicidad;
	}

	public void setIdAtributoUnicidad(int idAtributoUnicidad) {
		this.idAtributoUnicidad = idAtributoUnicidad;
	}

	public int getIdAtributo() {
		return idAtributo;
	}

	public void setIdAtributo(int idAtributo) {
		this.idAtributo = idAtributo;
	}

	public int getIdAtributoFormato() {
		return idAtributoFormato;
	}

	public void setIdAtributoFormato(int idAtributoFormato) {
		this.idAtributoFormato = idAtributoFormato;
	}

	public int getIdAtributoFI() {
		return idAtributoFI;
	}

	public void setIdAtributoFI(int idAtributoFI) {
		this.idAtributoFI = idAtributoFI;
	}

	public int getIdAtributoFT() {
		return idAtributoFT;
	}

	public void setIdAtributoFT(int idAtributoFT) {
		this.idAtributoFT = idAtributoFT;
	}

	public int getIdAtributo2() {
		return idAtributo2;
	}

	public void setIdAtributo2(int idAtributo2) {
		this.idAtributo2 = idAtributo2;
	}

	public int getIdOperador() {
		return idOperador;
	}

	public void setIdOperador(int idOperador) {
		this.idOperador = idOperador;
	}

	public int getIdAtributo1() {
		return idAtributo1;
	}

	public void setIdAtributo1(int idAtributo1) {
		this.idAtributo1 = idAtributo1;
	}

	public Integer getIdSel() {
		return idSel;
	}

	public void setIdSel(Integer idSel) {
		this.idSel = idSel;
	}

	
}
