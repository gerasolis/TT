<?xml version="1.0" encoding="UTF-8" ?>

<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0"
	xmlns:s="/struts-tags" xmlns:sj="/struts-jquery-tags">
	<jsp:directive.page language="java"
		contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Casos de uso</title>
<![CDATA[
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/content/editor/cu/js/index-editNew.js"></script>
]]>
</head>
<body>
	<h1>Registrar Caso de uso</h1>
	
	<s:actionmessage theme="jquery" />
	<s:actionerror theme="jquery" />
	<br/>
	<div class="menuSuperiorCU"><jsp:include
			page="/content/editor/menus/menuSuperiorCU.jsp" /></div>

	<p class="instrucciones">Ingrese la información solicitada.</p>


	<s:form id="frmCU" theme="simple"
		action="%{#pageContext.request.contextPath}/cu" 
		method="post" onsubmit="return getSubmitActor();">
		<div class="formulario">
			<div class="tituloFormulario">Información general del caso de
				uso</div>
			<table class="seccion">
				<tr>
					<td class="label"><s:text name="labelIdentificador" /></td>
					<td class="labelDerecho"><s:property value="model.clave + ' ' + model.numero"/>
							<s:fielderror fieldName="model.clave" cssClass="error" theme="jquery" />
							<s:fielderror fieldName="model.numero" cssClass="error" theme="jquery" /></td>
					<s:hidden value="%{model.clave}" name="model.clave"/>
					<s:hidden value="%{model.numero}" name="model.numero"/>
					<s:hidden value="%{model.id}" name="model.id"/>
				</tr>
				<tr>
					<td class="label obligatorio"><s:text name="labelNombre" /></td>
					<td><s:textfield name="model.nombre"
							cssErrorClass="input-error" cssClass="inputFormulario" /> <s:fielderror
							fieldName="model.nombre" cssClass="error" theme="jquery" /></td>
				</tr>
				<tr>
						<td class="label"><s:text name="labelDescripcion" /></td>
						<td><s:textarea rows="5" name="model.descripcion"
								maxlength="999" cssErrorClass="input-error"></s:textarea> 
								<s:fielderror
								fieldName="model.descripcion" cssClass="error"
								theme="jquery" /></td>
					</tr>
			</table>
		</div>
		<div class="formulario">
			<div class="tituloFormulario">Descripción del caso de uso</div>
			<div class="seccion">
				<table>
					<tr>
						<td class="label"><s:text name="labelActores" /></td>
						<td><s:textarea rows="5" name="model.redaccionActores"
								maxlength="999" cssErrorClass="input-error"></s:textarea>
								<s:fielderror
								fieldName="model.redaccionActores" cssClass="error"
								theme="jquery" /> </td>
					</tr>
					<tr>
						<td class="label"><s:text name="labelEntradas" /></td>
						<td><s:textarea rows="5" name="model.redaccionEntradas"
								maxlength="999" cssErrorClass="input-error"></s:textarea> <s:fielderror
								fieldName="model.redaccionEntradas" cssClass="error"
								theme="jquery" /></td>
					</tr>
					<tr>
						<td class="label"><s:text name="labelSalidas" /></td>
						<td><s:textarea rows="5" name="model.redaccionSalidas"
								maxlength="999" cssErrorClass="input-error"></s:textarea> <s:fielderror
								fieldName="model.redaccionSalidas" cssClass="error"
								theme="jquery" /></td>
					</tr>
					<tr>
						<td class="label"><s:text
								name="labelReglasNegocio" /></td>
						<td><s:textarea rows="5" name="model.redaccionReglasNegocio"
								maxlength="999" cssErrorClass="input-error"></s:textarea> <s:fielderror
								fieldName="model.redaccionReglasNegocio" cssClass="error"
								theme="jquery" /></td>
					</tr>
				</table>

			</div>
		</div>
		<div class="formulario">
			<div class="tituloFormulario">Precondiciones</div>
			<br />
			<table class="tablaGestion" id="precondiciones">
				<thead>
					<tr>
						<th style="width: 20%;">Número</th>
						<th style="width: 60%;">Redacción</th>
						<th style="width: 20%;">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="listPrecondiciones" var="precondicion">
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>

			<br />
			<div align="center">
				<sj:a openDialog="precondDialog" button="true">Registrar</sj:a>
			</div>
			<br />
		</div>
		<div class="formulario">
			<div class="tituloFormulario">Postcondiciones</div>
			<br />
			<table class="tablaGestion" id="postcondiciones">
				<thead>
					<tr>
						<th style="width: 20%;">Número</th>
						<th style="width: 60%;">Redacción</th>
						<th style="width: 20%;">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="listPostcondiciones" var="postcondicion">
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<br />
			<div align="center">
				<input class="boton" type="button" action="precondicion"
					value="Registrar" />
			</div>
			<br />
		</div>
		<div class="formulario">
			<div class="tituloFormulario">Puntos de extensión</div>
			<br />
			<table class="tablaGestion" id="puntosExtension">
				<thead>
					<tr>
						<th style="width: 30%;">Causa</th>
						<th style="width: 30%;">Región</th>
						<th style="width: 30%;">Caso de uso que extiende</th>
						<th style="width: 10%;">Acciones</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="listPtosExtension" var="pExtension">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<br />
			<div align="center">
				<input class="boton" type="button" action="precondicion"
					value="Registrar" />
			</div>
			<br />
		</div>
		<br />
		<div align="center">
			<s:submit class="boton" value="Aceptar" />

			<input class="boton" type="button"
				onclick="location.href='${pageContext.request.contextPath}/cu'"
				value="Cancelar" />
		</div>    	
	</s:form>
	
	
	<!-- PRECONDICIONES -->	
   	<sj:dialog id="precondDialog" title="Registrar Precondición" autoOpen="true" 
   	minHeight="300" minWidth="800" modal="true" draggable="true" >
	   	<s:form id="frmPrecondiciones" theme="simple" name="frmPrecondicionesName"
			onSubmit="return registrarPrecondicion()">
			<div class="formulario">
				<div class="tituloFormulario">Información de la Precondición</div>
				<table class="seccion">
					<tr>
						<td class="label obligatorio"><s:text name="labelRedaccion" /></td>
						<td><s:textarea rows="5" name="precondicion.redaccion"
								maxlength="999" cssErrorClass="input-error"></s:textarea> <s:fielderror
								fieldName="precondicion.redaccion" cssClass="error"
								theme="jquery" /></td>
					</tr>
				</table>
			</div>
			<br />
				<div align="center">
					<s:submit value="Aceptar" />
	
					<input type="button"
						onclick="cancelarRegistrarPre()"
						value="Cancelar" />
				</div>
		</s:form>
	</sj:dialog>
	

	
	
	
</body>
	</html>
</jsp:root>