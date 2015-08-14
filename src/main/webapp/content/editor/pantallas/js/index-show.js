var contextPath = "error";

$(document).ready(function() {
	contextPath = $("#rutaContexto").val();
	
	
	cargarImagenPantalla();
	
	var json = $("#jsonAccionesTabla").val();
	var jsonImg = $("#jsonImagenesAcciones").val(); 
	if (json !== "") {
		var parsedJson = JSON.parse(json);
		var parsedJsonImg = JSON.parse(jsonImg);
		$
				.each(
						parsedJson,
						function(i, item) {
					    	if(parsedJsonImg[i] != "") {
					    		console.log("accion" + item.id);
					    		console.log("marco-accion" + item.id);
					    		document.getElementById("accion" + item.id).src = parsedJsonImg[i];
					    		document.getElementById("marco-accion" + item.id).style.display = '';
					    	} 
					    		
							
							
						}); 
	}
});

function cargarImagenPantalla() {
	var imgPantalla = document.getElementById("pantallaB64").value;
	if(imgPantalla != "") {
		document.getElementById("pantalla").src = imgPantalla;
		document.getElementById("marco-pantalla").style.display = '';
	}
}