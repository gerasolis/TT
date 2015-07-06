package mx.prisma.editor.bs;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.hibernate.HibernateException;
import org.hibernate.JDBCException;

import mx.prisma.admin.model.Proyecto;
import mx.prisma.editor.dao.EstadoElementoDAO;
import mx.prisma.editor.dao.MensajeDAO;
import mx.prisma.editor.dao.ParametroDAO;
import mx.prisma.editor.model.Mensaje;
import mx.prisma.editor.model.MensajeParametro;
import mx.prisma.editor.model.Parametro;
import mx.prisma.util.PRISMAException;
import mx.prisma.util.PRISMAValidacionException;
import mx.prisma.util.Validador;

public class MensajeBs {
	private static final String CLAVE = "MSG";

	public static List<Mensaje> consultarMensajesProyecto(Proyecto proyecto) {
		List<Mensaje> listMensajes = new MensajeDAO().consultarMensajes(proyecto.getId());
		if(listMensajes == null) {
			throw new PRISMAException("No se pueden consultar los mensajes.", "MSG13");
		}
		return listMensajes;
	}

	public static void registrarMensaje(Mensaje model) throws Exception{
		try {
				validar(model);
				model.setClave(CLAVE);
				model.setEstadoElemento(new EstadoElementoDAO()
						.consultarEstadoElemento(ElementoBs.getIDEstadoEdicion()));
				model.setNombre(model.getNombre().trim());
				new MensajeDAO().registrarMensaje(model);
		} catch (JDBCException je) {
				if(je.getErrorCode() == 1062)
				{
					throw new PRISMAValidacionException("El nombre del mensaje ya existe.", "MSG7",
							new String[] { "El","Mensaje", model.getNombre()}, "model.nombre");
				}
				System.out.println("ERROR CODE " + je.getErrorCode());
				je.printStackTrace();
				throw new Exception();
		} catch(HibernateException he) {
			he.printStackTrace();
			throw new Exception();
		}
		
	}

	private static void validar(Mensaje model) {
		//Validaciones del número
		if(Validador.esNuloOVacio(model.getNumero())) {
			throw new PRISMAValidacionException("El usuario no ingresó el número del mensaje.", "MSG4", null, "model.numero");
		}
		if(!Pattern.matches("[1-9]+[0-9]*", model.getNumero())) {
			throw new PRISMAValidacionException("El usuario no ingresó un número válido", "MSG5", new String[]{"un", "número entero"}, "model.numero");
		}
		
		//Se asegura la unicidad del nombre y del numero
		List<Mensaje> mensajes = consultarMensajesProyecto(model.getProyecto());
		for(Mensaje msj : mensajes) {
			if(msj.getId() != model.getId()) {
				if(msj.getNombre().equals(model.getNombre())) {
					throw new PRISMAValidacionException("El nombre del mensaje ya existe.", "MSG7",
							new String[] { "El","Mensaje", msj.getNombre()}, "model.nombre");
				}
				if(msj.getNumero().equals(model.getNumero())) {
					throw new PRISMAValidacionException("El numero del mensaje ya existe.", "MSG7",
							new String[] { "El","Mensaje", msj.getNumero()}, "model.numero");
				}
			}
		}
		
		// Validaciones del nombre
		if(Validador.esNuloOVacio(model.getNombre())) {
			throw new PRISMAValidacionException("El usuario no ingresó el nombre del mensaje.", "MSG4", null, "model.nombre");
		}
		if(Validador.validaLongitudMaxima(model.getNombre(), 200)) {
			throw new PRISMAValidacionException("El usuario ingreso un nombre muy largo.", "MSG6", new String[] { "200",
			"caracteres"}, "model.nombre");
		}
		if(Validador.contieneCaracterInvalido(model.getNombre())) {
			throw new PRISMAValidacionException("El usuario ingreso un nombre con caracter inválido.", "MSG23", new String[] { "El",
			"nombre"}, "model.nombre");
		}
		//Validaciones de la Descripción
		if(model.getDescripcion() != null && Validador.validaLongitudMaxima(model.getDescripcion(), 999)) {
			throw new PRISMAValidacionException("El usuario ingreso una descripcion muy larga.", "MSG6", new String[] { "999",
			"caracteres"}, "model.descripcion");
		}
		//Validaciones de la Redacción
		if(Validador.esNuloOVacio(model.getRedaccion())) {
			throw new PRISMAValidacionException("El usuario no ingresó la redaccion del mensaje.", "MSG4", null, "model.redaccion");
		}
		if(model.getRedaccion() != null && Validador.validaLongitudMaxima(model.getRedaccion(), 999)) {
			throw new PRISMAValidacionException("El usuario ingreso una redaccion muy larga.", "MSG6", new String[] { "999",
			"caracteres"}, "model.redaccion");
		}
		
		//Validaciones de mensaje parametrizado
		if(model.isParametrizado()) {
			List<Parametro> parametros = obtenerParametros(model.getRedaccion(), model.getProyecto().getId());
			if(parametros.size() != model.getParametros().size()) {
				throw new PRISMAValidacionException("El usuario no ingresó la descripcion de algun parametros del mensaje.", "MSG24", null, "model.parametros");
			}
			//Validacion de las descripciones de los parámetros
			for(MensajeParametro mp : model.getParametros()) {
				if(Validador.esNuloOVacio(mp.getParametro().getDescripcion())) {
					throw new PRISMAValidacionException("El usuario no ingresó la descripcion de algun parametros del mensaje.", "MSG24", null, "model.parametros");
				}
			}
		}
		
	}
	
	public static boolean esParametrizado(String redaccion) {
		ArrayList<String> tokens = TokenBs.procesarTokenIpunt(redaccion);
				
		if(tokens.size() == 0) {
			return false;
		} else {
			return true;
		}
	}

	public static List<Parametro> obtenerParametros(String redaccion, int idProyecto) {
		//Se convierte la lista de parametros en json para enviarlos a la vista
		ArrayList<String> tokens = TokenBs.procesarTokenIpunt(redaccion);
		ArrayList<Parametro> listParametros = new ArrayList<Parametro>();
		if(listParametros.size() > 10) {
			throw new PRISMAValidacionException("El usuario no ingresó la descripcion de algun parametros del mensaje.", "MSG6", new String[]{"10", "parámetros"}, 
					"model.parametros");
		}
		ArrayList<String> segmentos;
		for(String token : tokens) {
			segmentos = TokenBs.segmentarToken(token);
			//Se hace la consulta con base en el nombre
			Parametro parametro = consultarParametro(segmentos.get(1), idProyecto);
			if(parametro == null) {
				//Si el parámetro existe en la bd
				parametro = new Parametro(segmentos.get(1),"");
			}
			if (!pertecene(parametro, listParametros)) {
				listParametros.add(parametro);
			}
		}
		return listParametros;
	}

	private static boolean pertecene(Parametro parametro,
			ArrayList<Parametro> listParametros) {
		for (Parametro parametroi : listParametros) {
			if (parametroi.getNombre().equals(parametro.getNombre())) {
				return true;
			}
		}
		return false;
	}

	public static Parametro consultarParametro(String nombre, int idProyecto) {
		Parametro parametro = new ParametroDAO().consultarParametro(nombre, idProyecto);
		return parametro;
	}

	public static List<Parametro> consultarParametros(int idProyecto) {
		List<Parametro> listParametros = new ParametroDAO().consultarParametros(idProyecto);
		return listParametros;
	}
	
}
