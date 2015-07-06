var contextPath = "prisma";


$(document).ready(function() {
	contextPath = $("#rutaContexto").val();
	//Agregar Elementos a la lista desplegable
	var json = $("#jsonAtributos").val();
	if (json !== "") {
		var entidades = document.getElementById("entidades");
		var parsedJson = JSON.parse(json);
		$
				.each(
						parsedJson,
						function(i, item) {
							var option = document.createElement("option");
							option.text = item.nombre;
							option.index = i;
							entidades.add(option);
						});
	}
	//Pruebas
	document.getElementById("idTipoRN").selectedIndex = 10;
	//Fin pruebas
	mostrarCamposTipoRN();
} );

function mostrarCamposTipoRN() {
	var select = document.getElementById("idTipoRN");
	var tipoRN = select.options[select.selectedIndex].text;
	//Se ocultan los todos los campos
	document.getElementById("filaEntidad1").className = "oculto";
	document.getElementById("filaAtributo1").className = "oculto";
	document.getElementById("filaEntidad2").className = "oculto";
	document.getElementById("filaAtributo2").className = "oculto";
	document.getElementById("filaOperador").className = "oculto";
	document.getElementById("filaTextoAyudaInterF").className = "oculto";
	document.getElementById("filaTextoAyudaTipoRN").className = "oculto";
	//Se selecciona la primer opción de los elementos
	document.getElementById("entidad1").selectedIndex = 0;
	document.getElementById("atributo1").selectedIndex = 0;
	document.getElementById("entidad2").selectedIndex = 0;
	document.getElementById("atributo2").selectedIndex = 0;
	document.getElementById("operador").selectedIndex = 0;
	var instrucciones;
	if(tipoRN == "Verificación de catálogos"){
		console.log("1");
		document.getElementById("instrucciones").innerHTML = "Indica que el sistema deberá verificar la existencia de los catálogos para realizar alguna operación.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
	} else if(tipoRN == "Comparación de atributos") {		
		console.log("2");
		document.getElementById("instrucciones").innerHTML = "Indica restricciones entre los valores de algunos atributos, solamente se permite hacer comparaciones" +
																"entre atributos numéricos o entre atributos de tipo cadena.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		document.getElementById("filaEntidad1").className = "";
		document.getElementById("filaAtributo1").className = "";
		document.getElementById("filaOperador").className = "";
		document.getElementById("filaEntidad2").className = "";
		document.getElementById("filaAtributo2").className = "";
	} else if(tipoRN == "Unicidad de parámetros"){
		console.log("3");
		document.getElementById("instrucciones").innerHTML = "Permite indicar los atributos que hacen única una entidad dentro del sistema.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		document.getElementById("filaEntidad1").className = "";
		document.getElementById("filaAtributo1").className = "";
	} else if(tipoRN == "Datos obligatorios"){
		console.log("4");
		document.getElementById("instrucciones").innerHTML = "Indica que todos los datos marcados como obligatorios deberán ser ingresados por el usuario.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
	} else if(tipoRN == "Longitud correcta"){
		document.getElementById("instrucciones").innerHTML = "Indica que la longitud máxima de los atributos no puede ser rebasada.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		console.log("5");
	} else if(tipoRN == "Tipo de dato correcto"){
		document.getElementById("instrucciones").innerHTML = "Indica que todos los campos que ingrese el usuario deberán cumplir con el tipo de dato indicado.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		console.log("6");
	} else if(tipoRN == "Formato de archivos"){
		document.getElementById("instrucciones").innerHTML = "Indica que los archivos proporcionados por el usuario deberán cumplir con el formato especificado.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		console.log("7");
	} else if(tipoRN == "Tamaño de archivos"){
		document.getElementById("instrucciones").innerHTML = "Indica que los archivos que proporcione el usuario no podrán rebasar el tamaño máximo especificado.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		console.log("8");
	} else if(tipoRN == "Intervalo de fechas correcto"){
		console.log("9");
		document.getElementById("instrucciones").innerHTML = "Indica el orden temporal que deberán tener dos atributos de tipo fecha.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		document.getElementById("filaTextoAyudaInterF").className = "";
		document.getElementById("filaEntidad1").className = "";
		document.getElementById("filaAtributo1").className = "";
		document.getElementById("filaEntidad2").className = "";
		document.getElementById("filaAtributo2").className = "";
	} else if(tipoRN == "Formato correcto"){
		document.getElementById("instrucciones").innerHTML = "Indica que los datos proporcionados deben cumplir con la expresión regular indicada.";
		document.getElementById("filaTextoAyudaTipoRN").className = "";
		console.log("10");
	} else if(tipoRN == "Otro"){
		console.log("11");
	} 
	
}

function cargarAtributos(select) {
	var idEntidad = select.value;
	console.log("idEntidad desde mostrarAtributos " + select.value);
	rutaCargarAtributos = contextPath + '/reglas-negocio!cargarAtributos';
	console.log("rutaCargarAtributos: " + rutaCargarAtributos);
	$.ajax({
		dataType : 'json',
		url : rutaCargarAtributos,
		type: "POST",
		data : {
			idEntidad : idEntidad
		},
		success : function(data) {
			mostrarListaAtributos(data);
		},
		error : function(err) {
			console.log("AJAX error in request: " + JSON.stringify(err, null, 2));
		}
	});
}

function mostrarListaAtributos(json) {
	console.log("json: " + json);
	if (json !== "") {
		var atributos = document.getElementById("atributo1");
		$
				.each(
						json,
						function(i, item) {
							console.log("Elemento rec " + i);
							console.log("item: " + item);
							var option = document.createElement("option");
							option.text = item.nombre;
							option.index = i;
							atributos.add(option);
						});
	}
} 

function registrarPaso(){
	var numero = calcularNumeroPaso();
	var realiza = document.forms["frmPasoName"]["paso.realizaActor"].value;
	var redaccion = document.forms["frmPasoName"]["paso.redaccion"].value;
	var verbo = document.forms["frmPasoName"]["paso.verbo"].value;
	
	var up = "up";
    if (esValidoPaso("tablaPaso", realiza, verbo, redaccion)) {
    	var realizaImg;
    	//Se agrega la imagen referente a quien realiza el paso
    	if(realiza == "Actor") {
    		var realizaActor = true;
    		realizaImg = "<img src='" + window.contextPath + 
			"/resources/images/icons/actor.png' title='Actor' style='vertical-align: middle;'/>";
    	} else if(realiza == "Sistema") {
    		realizaActor = false;
    		realizaImg = "<img src='" + window.contextPath + 
			"/resources/images/icons/uc.png' title='Sistema' style='vertical-align: middle;'/>";
    	}
    	//Se construye la fila 
    	var row = [
    	            numero,
    	            realizaImg + " " + verbo + " " +redaccion,
    	            realizaActor,
    	            verbo, 
    	            redaccion,
					"<center>" +
						"<a onclick='dataTableCDT.moveRow(tablaPaso, this, \"up\");' button='true'>" +
						"<img class='icon'  id='icon' src='" + window.contextPath + 
						"/resources/images/icons/flechaArriba.png' title='Subir Paso'/></a>" +
						"<a onclick='dataTableCDT.moveRow(tablaPaso, this, \"down\");' button='true'>" +
						"<img class='icon'  id='icon' src='" + window.contextPath + 
						"/resources/images/icons/flechaAbajo.png' title='Bajar Paso'/></a>" +
						"<a button='true'>" +
						"<img class='icon'  id='icon' src='" + window.contextPath + 
						"/resources/images/icons/editar.png' title='Modificar Paso'/></a>" +
						"<a onclick='dataTableCDT.deleteRowPasos(tablaPaso, this);' button='true'>" +
						"<img class='icon'  id='icon' src='" + window.contextPath + 
						"/resources/images/icons/eliminar.png' title='Eliminar Paso'/></a>" +
					"</center>" ];
    	dataTableCDT.addRow("tablaPaso", row);
    	
    	//Se limpian los campos
    	document.getElementById("inputor").value = "";
    	document.getElementById("realiza").selectedIndex = 0;
    	document.getElementById("verbo").selectedIndex = 0;
    	
    	//Se cierra la emergente
    	$('#pasoDialog').dialog('close');
    } else {
    	return false;
    }
};
  
function cancelarRegistrarPaso() {
	//Se limpian los campos
	document.getElementById("inputor").value = "";
	document.getElementById("realiza").selectedIndex = 0;
	document.getElementById("verbo").selectedIndex = 0;
	
	//Se cierra la emergente
	$('#pasoDialog').dialog('close');
};

/*
 * Agrega un mensaje en la pantalla
 */
function agregarMensaje(mensaje) {
	alert(mensaje);
};

/*
 * Verifica que la redacción sea válida
 */
function esValidoPaso(idTabla, realiza, verbo, redaccion) {
	if(vaciaONula(redaccion) && realiza != -1 && verbo != -1) {
		agregarMensaje("Agregue todos los campos obligatorios.");
		return false;
	} 
	console.log("longitud de redaccione " + redaccion.length);
	if(redaccion.length > 999) {
		agregarMensaje("Ingrese menos de 999 caracteres.");
		return false;
	} 
 
	return true;
}

function prepararEnvio() {
	try {
		tablaToJson("tablaPaso");
		return true;
	} catch(err) {
		alert("Ocurrió un error.");
		return false;
	}
}

function tablaToJson(idTable) {
	var table = $("#" + idTable).dataTable();
	var arregloPasos = [];
	
	for (var i = 0; i < table.fnSettings().fnRecordsTotal(); i++) {
		arregloPasos.push(new Paso(table.fnGetData(i, 0), table.fnGetData(i, 2), 
						table.fnGetData(i, 3), table.fnGetData(i, 4)));
	}
	var jsonPasos = JSON.stringify(arregloPasos);
	document.getElementById("jsonPasosTabla").value = jsonPasos;
}

function calcularNumeroPaso() {
	return $("#tablaPaso").dataTable().fnSettings().fnRecordsTotal() + 1;
}

function ocultarColumnas(tabla) {
	var dataTable = $("#" + tabla).dataTable();
	dataTable.api().column(2).visible(false);
	dataTable.api().column(3).visible(false);
	dataTable.api().column(4).visible(false);
}

function verificarAlternativaPrincipal() {
	var existeTPrincipal = document.getElementById("existeTPrincipal").value;
	var select = document.getElementById("idAlternativaPrincipal");
	if(existeTPrincipal == "true") {
		select.selectedIndex = 2;
		select.disabled = true;
		document.getElementById("textoAyudaPA").innerHTML = "Solamente puede registrar Trayectorias alternativas, debido a que ya existe una Trayectoria principal.";
	} 
}