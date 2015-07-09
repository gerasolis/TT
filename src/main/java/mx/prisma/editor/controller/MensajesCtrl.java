package mx.prisma.editor.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ModelDriven;

import mx.prisma.admin.model.Proyecto;
import mx.prisma.editor.bs.ElementoBs;
import mx.prisma.editor.bs.EntidadBs;
import mx.prisma.editor.bs.MensajeBs;
import mx.prisma.editor.model.Mensaje;
import mx.prisma.editor.model.MensajeParametro;
import mx.prisma.editor.model.Parametro;
import mx.prisma.util.ActionSupportPRISMA;
import mx.prisma.util.ErrorManager;
import mx.prisma.util.JsonUtil;
import mx.prisma.util.PRISMAException;
import mx.prisma.util.PRISMAValidacionException;
import mx.prisma.util.SessionManager;

@ResultPath("/content/editor/")
@Results({ @Result(name = ActionSupportPRISMA.SUCCESS, type = "redirectAction", params = {
		"actionName", "mensajes"}),
})
public class MensajesCtrl extends ActionSupportPRISMA implements ModelDriven<Mensaje>, SessionAware{
	private static final long serialVersionUID = 1L;
	private Map<String, Object> userSession ;

	// Proyecto y módulo
	private Proyecto proyecto;
	private Mensaje model;
	private List<Mensaje> listMensajes;

	//private List<Parametro> listParametros;
	private String jsonParametros;
	private String jsonParametrosGuardados;
	private String cambioRedaccion;
	private boolean parametrizado = false;
	private Integer idSel;
	private boolean existenParametros;
	public String index() {
		try {
			//Se consulta el proyecto activo
			proyecto = SessionManager.consultarProyectoActivo();
			
			
			model.setProyecto(proyecto);
			listMensajes = MensajeBs.consultarMensajesProyecto(proyecto);
			
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
			buscarParametrosDisponibles(SessionManager.consultarProyectoActivo().getId());
			// Creación del modelo
			proyecto = SessionManager.consultarProyectoActivo();
			model.setClave("MSG");
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
	
	private void buscarParametrosDisponibles(int idProyecto) {
		List<Parametro> listParametrosAux = MensajeBs.consultarParametros(idProyecto);
		List<Parametro> listParametros = new ArrayList<Parametro>();
		for(Parametro par : listParametrosAux) {
			Parametro parametroAux = new Parametro();
			parametroAux.setNombre(par.getNombre());
			parametroAux.setDescripcion(par.getDescripcion());
			listParametros.add(parametroAux);
		}
		
		// Se convierte en json las Reglas de Negocio
		if (listParametros != null) {
			this.jsonParametrosGuardados = JsonUtil.mapListToJSON(listParametros);
		}
		
	}

	public String create() {
		String resultado = null;
		try {
			proyecto = SessionManager.consultarProyectoActivo();
			//Se verifica si es parametrizado 
			if(MensajeBs.esParametrizado(model.getRedaccion())) {
				
				List<Parametro> listParametros = JsonUtil.mapJSONToArrayList(jsonParametros, Parametro.class);
				if(listParametros.isEmpty() || this.cambioRedaccion.equals("true")) {
					cambioRedaccion = "true";
					listParametros = MensajeBs.obtenerParametros(model.getRedaccion(), proyecto.getId());
					this.jsonParametros = JsonUtil.mapListToJSON(listParametros);
					return editNew();
				}
				
			} 
			model.setProyecto(proyecto);
			agregarParametros();

			//Se prepara el modelo para el registro
			model.setProyecto(proyecto);
			model.setEstadoElemento(ElementoBs.consultarEstadoElemento(ElementoBs.getIDEstadoEdicion()));
			 
			//Se registra el mensaje
			MensajeBs.registrarMensaje(model);
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

	public String show() throws Exception{
		String resultado = null;
		try {
			model = MensajeBs.consultarMensaje(idSel);
			this.existenParametros = model.getParametros().size() > 0 ? true : false;
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
	
	private void agregarParametros() throws Exception {
		model.setParametrizado(true);
		if(jsonParametros != null && !jsonParametros.equals("")) {
			Set<Parametro> parametros = JsonUtil.mapJSONToSet(jsonParametros, Parametro.class);
			
			for(Parametro p : parametros) {
				Parametro parametroAux = MensajeBs.consultarParametro(p.getNombre(), SessionManager.consultarProyectoActivo().getId());
				if(parametroAux != null) {
					//Si existe, debe mantener los cambios hechos en la vista
					parametroAux.setDescripcion(p.getDescripcion());
					model.getParametros().add(new MensajeParametro(model, parametroAux));
				} else {
					p.setProyecto(proyecto);
					model.getParametros().add(new MensajeParametro(model, p));
				}
			}
		}
	}

	public void setSession(Map<String, Object> session) {
	}

	public Mensaje getModel() {
		if(model == null){
			model = new Mensaje();
		}
		return model;
	}

	public List<Mensaje> getListMensajes() {
		return listMensajes;
	}

	public void setListMensajes(List<Mensaje> listMensajes) {
		this.listMensajes = listMensajes;
	}

	public void setModel(Mensaje model) {
		this.model = model;
	}

	public String getCambioRedaccion() {
		return cambioRedaccion;
	}

	public void setCambioRedaccion(String cambioRedaccion) {
		this.cambioRedaccion = cambioRedaccion;
	}

	public String getJsonParametros() {
		return jsonParametros;
	}

	public void setJsonParametros(String jsonParametros) {
		this.jsonParametros = jsonParametros;
	}

	public String getJsonParametrosGuardados() {
		return jsonParametrosGuardados;
	}

	public void setJsonParametrosGuardados(String jsonParametrosGuardados) {
		this.jsonParametrosGuardados = jsonParametrosGuardados;
	}
	
	public boolean isParametrizado() {
		return parametrizado;
	}
	
	public void setParametrizado(boolean parametrizado) {
		this.parametrizado = parametrizado;
	}

	public Integer getIdSel() {
		return idSel;
	}

	public void setIdSel(Integer idSel) {
		this.idSel = idSel;
	}

	public boolean isExistenParametros() {
		return existenParametros;
	}

	public void setExistenParametros(boolean existenParametros) {
		this.existenParametros = existenParametros;
	}

	
	
}
