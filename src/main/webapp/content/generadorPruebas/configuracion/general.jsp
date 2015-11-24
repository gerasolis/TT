<?xml version="1.0" encoding="UTF-8" ?>

<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0"
	xmlns:s="/struts-tags" xmlns:sj="/struts-jquery-tags">
	<jsp:directive.page language="java"
		contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Configuración general</title>
<![CDATA[
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/content/generadorPruebas/configuracion/js/general.js"></script>	
]]>

</head>
<body>
	<h1>Configuración general</h1>

	<s:actionmessage theme="jquery" />
	<s:actionerror theme="jquery" />
	<br />

	<p class="instrucciones">Ingrese la información solicitada.</p>
	<s:form autocomplete="off" id="frmConfiguracion" theme="simple"
		action="%{#pageContext.request.contextPath}/configuracion-general!configurar" method="post">
		<div class="formulario">
			<div class="tituloFormulario">Configuración de la conexión a la base de datos</div>
			<table class="seccion">
				<tr>
					<td class="label obligatorio"><s:text name="labelURL" /></td>
					<td><s:textfield name="cbd.urlBaseDatos" maxlength="500"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="cbd.urlBaseDatos" cssClass="error"
							theme="jquery" /></td>
				</tr>
				<tr>
					<td class="label obligatorio"><s:text name="labelDriver" /></td>
					<td><s:textfield name="cbd.driver" maxlength="50"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="cbd.driver" cssClass="error"
							theme="jquery" /></td>
				</tr>
				<tr>
					<td class="label obligatorio"><s:text name="labelUsuario" /></td>
					<td><s:textfield name="cbd.usuario" maxlength="50"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="cbd.usuario" cssClass="error"
							theme="jquery" /></td>
				</tr>
				<tr>
					<td class="label obligatorio"><s:text name="labelContrasenia" /></td>
					<td><s:textfield name="cbd.contrasenia" maxlength="50"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="cbd.contrasenia" cssClass="error"
							theme="jquery" /></td>
				</tr>
			</table>
		</div>
		<div class="formulario">
			<div class="tituloFormulario">Configuración HTTP</div>
			<table class="seccion">
				<tr>
					<td class="label obligatorio"><s:text name="labelIp" /></td>
					<td><s:textfield name="chttp.ip" maxlength="16"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="chttp.ip" cssClass="error"
							theme="jquery" /></td>
				</tr>
				<tr>
					<td class="label obligatorio"><s:text name="labelPuerto" /></td>
					<td><s:textfield name="chttp.puerto"
							cssErrorClass="input-error" cssClass="inputFormulario ui-widget" />
						<s:fielderror fieldName ="chttp.puerto" cssClass="error"
							theme="jquery" /></td>
				</tr>
			</table>
		</div>
		
		<br />
		<div align="center">
			<input class="boton" type="button"
				onclick="guardarSalir();"
				value="Guardar" />
				
			<input class="boton" type="button"
				onclick="siguiente();"
				value="Siguiente" />

			<s:url var="urlGestionarCU"
				value="%{#pageContext.request.contextPath}/cu">
			</s:url>
			<input class="boton" type="button"
				onclick="location.href='${urlGestionarCU}'"
				value="Cancelar" />
		</div>
	</s:form>
</body>
	</html>
</jsp:root>