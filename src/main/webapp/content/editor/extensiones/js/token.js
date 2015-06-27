var token = function() {

	/* Tipos de lista
	 * 		Tipo F: TK.CUMODULO:claveTrayectoria.numero
	 * 				Pasos
	 */

	var at_configP;

	
	cargarListasToken = function() {		
		//Pasos
		json = $("#jsonPasos").val();
		if (json !== "" && json != null) {
			var listaElementos = JSON.parse(json);
			at_configP = cargaLista("F", "P", listaElementos);
		}
		
		/* Se configuran los tokens que estarán disponibles en los
		 * textAreas.
		 */

		$inputor = $('#inputor').atwho(at_configP);
		$inputor.caret('pos', 60);
		$inputor.focus().atwho('run');
	}

	function cargaLista(tipo, token, listaObjetos) {
		if (tipo == "F") {
			var lista = $.map(listaObjetos, function(value, i) {
				return {
					'id' : i,
					"claveCU" : value.trayectoria.casoUso.clave,
					"numeroCU" : value.trayectoria.casoUso.numero,
					"claveTray": value.trayectoria.clave,
					"numero" : value.numero,
					"nombre" : value.trayectoria.casoUso.nombre,
					'name' : value.trayectoria.casoUso.clave
					+ separador1 + value.trayectoria.casoUso.numero + separador2
					+ remplazarEspaciosGuion(value.trayectoria.casoUso.nombre) + separador2 + remplazarEspaciosGuion(value.trayectoria.clave) + separador1
					+ value.numero
				};
			});
			var at_config = {
				at : token + separador1,
				data : lista,
				displayTpl : "<li><span class=\"listaToken\">" + token
				+ separador1 + "</span>" 
				+ "<span class=\"listaNombre\">${claveCU}" + separador1 + "${numeroCU}"
				+ separador2 + "${nombre}" + separador2 + "${claveTray}" 
				+ separador1 +"</span><span class=\"listaElementoInteres\">${numero}</span></li>",
				limit : 200
			}
		}


		return at_config;
	}

	function remplazarEspaciosGuion(cadenaConEsp) {
		cadenaSinEsp = cadenaConEsp.replace(/\s/g, "_");
		return cadenaSinEsp;
	}

	function remplazarEspaciosGuionBlanco(cadenaConEsp) {
		cadenaSinEsp = cadenaConEsp.replace(/\s/g,
				"<font color=\"white\">_</font>");
		return cadenaSinEsp;
	}

	return {
		cargarListasToken : cargarListasToken,
	};
}();
