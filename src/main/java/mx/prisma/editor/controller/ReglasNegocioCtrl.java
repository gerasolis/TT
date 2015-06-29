package mx.prisma.editor.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import mx.prisma.admin.model.Proyecto;
import mx.prisma.editor.bs.ElementoBs;
import mx.prisma.editor.bs.ReglaNegocioBs;
import mx.prisma.editor.dao.EntidadDAO;
import mx.prisma.editor.model.Atributo;
import mx.prisma.editor.model.Entidad;
import mx.prisma.editor.model.ReglaNegocio;
import mx.prisma.editor.model.TipoReglaNegocio;
import mx.prisma.util.ActionSupportPRISMA;
import mx.prisma.util.ErrorManager;
import mx.prisma.util.JsonUtil;
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
	private int idEntidad;
	private String jsonAtributos;
	private String jsonEntidades;
	private List<Entidad> listEntidades;
	private List<Atributo> listAtributos;
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
			buscarElementos();
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
	
	private void buscarElementos() throws Exception{
		listEntidades = new EntidadDAO().consultarEntidades(proyecto.getId());
		this.jsonEntidades = JsonUtil.	
	}

	public String create() {
		System.out.println("desde create");
		String resultado = null;
		try {
			System.out.println("idTipo " + idTipoRN);
			model.setTipoReglaNegocio(ReglaNegocioBs.consultaReglaNegocio(idTipoRN));
			System.out.println("."+model.getTipoReglaNegocio().getNombre());
			System.out.println(".."+model.getTipoReglaNegocio().getId());
			/*
			if(tipoRN == "Verificación de catálogos"){
				System.out.println("1");
			} else if(tipoRN == "Operaciones aritméticas") {
				System.out.println("2");
			} else if(tipoRN == "Unicidad de parámetros"){
				System.out.println("3");
			} else if(tipoRN == "Datos obligatorios"){
				System.out.println("4");
			} else if(tipoRN == "Longitud correcta"){
				System.out.println("5");
			} else if(tipoRN == "Tipo de dato correcto"){
				System.out.println("6");
			} else if(tipoRN == "Formato de archivos"){
				System.out.println("7");
			} else if(tipoRN == "Tamaño de archivos"){
				System.out.println("8");
			} else if(tipoRN == "Intervalo de fechas correctas"){
				System.out.println("9");
			} else if(tipoRN == "Formato correcto"){
				System.out.println("10");
			} else if(tipoRN == "Otro"){
				System.out.println("11");
			} else {
				//Validaciones del tipo de RN
				throw new PRISMAValidacionException("El usuario no seleccionó el tipo de regla de negocio.", "MSG4", null, "model.tipoReglaNegocio");
			}*/
			//Se prepara el modelo para el registro 
			proyecto = SessionManager.consultarProyectoActivo();
			model.setProyecto(proyecto);
			model.setEstadoElemento(ElementoBs.consultarEstadoElemento(ElementoBs.getIDEstadoEdicion()));
			
			//Se registra el mensaje
			ReglaNegocioBs.registrarReglaNegocio(model);
			resultado = SUCCESS;
			
			//Se agrega mensaje de éxito
			addActionMessage(getText("MSG1", new String[] { "El",
					"Mensaje", "registrado" }));
			
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
	
	public String cargarAtributos() {
		try {
			System.out.println("idEntidad " + this.idEntidad);
			Entidad entidad = new EntidadDAO().consultarEntidad(this.idEntidad);
			Set<Atributo> atributos = entidad.getAtributos();
			if(atributos != null && atributos.size() != 0) {
				jsonAtributos = JsonUtil.mapSetToJSON(entidad.getAtributos());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "direccion";
	}
		
	private void buscaCatalogos() {
		listTipoRN = ReglaNegocioBs.consultarTipoRN();
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		
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

	

}