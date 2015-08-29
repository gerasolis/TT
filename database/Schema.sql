create table Seccion (id int(10) not null auto_increment, nombre varchar(45) not null, primary key (id));
create table UnidadTamanio (id int(10) not null auto_increment, nombre varchar(45) not null, abreviatura varchar(10) not null, primary key (id), constraint uniqueUnidadAbreviatura unique (abreviatura), constraint uniqueUnidadNombre unique (nombre));
create table Mensaje_Parametro (id int(10) not null auto_increment, MensajeElementoid int(11) not null, Parametroid int(10) not null, primary key (id));
create table Parametro (id int(10) not null auto_increment, nombre varchar(45) not null, descripcion varchar(500) not null, Proyectoid int(11) not null, primary key (id), constraint uniqueParametro unique (nombre, Proyectoid));
create table Operador (id int(10) not null auto_increment, nombre varchar(45) not null, simbolo varchar(11) not null, primary key (id), constraint uniqueOperadorSimbolo unique (simbolo), constraint uniqueOperador unique (nombre));
create table TipoComparacion (id int(10) not null, nombre varchar(45) not null, primary key (id), constraint uniqueTipoComparacion unique (nombre));
create table Verbo (id int(10) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueVerbo unique (nombre));
create table TipoDato (id int(10) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueTipoDato unique (nombre));
create table Entidad (Elementoid int(11) not null, primary key (Elementoid));
create table Actualizacion (id int(11) not null auto_increment, fecha date not null, comentario varchar(999) not null, Elementoid int(11) not null, Colaborador_Proyectoid int(11) not null, primary key (id));
create table ReferenciaParametro (id int(10) not null auto_increment, numeroToken int(10) not null, TipoParametroid int(11) not null, PostPrecondicionid int(10), Pasoid int(10), Extensionid int(10), PasoidDestino int(10), ElementoidDestino int(11), AccionidDestino int(11), Atributoid int(11), Trayectoriaid int(10), primary key (id));
create table EstadoProyecto (id int(11) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueEstadoProyecto unique (nombre));
create table Telefono (id int(11) not null auto_increment, ColaboradorCURP varchar(18) not null unique, lada varchar(5) not null unique, numero varchar(10) not null unique, primary key (id));
create table Modulo (id int(11) not null auto_increment, clave varchar(10) not null, nombre varchar(45) not null, descripcion varchar(999) not null, Proyectoid int(11) not null, primary key (id), constraint uniqueModulo unique (clave, Proyectoid));
create table Colaborador_Proyecto (id int(11) not null auto_increment, ColaboradorCURP varchar(18) not null, Rolid int(11) not null, Proyectoid int(11) not null, primary key (id), constraint uniqueColaborador unique (ColaboradorCURP, Proyectoid));
create table Rol (id int(11) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueRol unique (nombre));
create table Colaborador (CURP varchar(18) not null, nombre varchar(45) not null, apellidoPaterno varchar(45) not null, apellidoMaterno varchar(45) not null, correoElectronico varchar(45) not null, contrasenia varchar(20) not null, administrador tinyint(1) not null, primary key (CURP));
create table EstadoElemento (id int(11) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueEstadoElemento unique (nombre));
create table Proyecto (id int(11) not null auto_increment, clave varchar(10) not null unique, nombre varchar(50) not null unique, fechaInicioProgramada date not null, fechaTerminoProgramada date not null, fechaInicio date, fechaTermino date, descripcion varchar(999) not null, presupuesto double, contraparte varchar(45) not null, EstadoProyectoid int(11) not null, primary key (id));
create table Revision (id int(11) not null auto_increment, observaciones varchar(999) not null, CasoUsoElementoid int(11) not null, revisado tinyint(1) not null, Seccionid int(10) not null, primary key (id));
create table Elemento (id int(11) not null auto_increment, clave varchar(10) not null, numero varchar(20) not null, nombre varchar(200) not null, descripcion varchar(999), EstadoElementoid int(11) not null, Proyectoid int(11) not null, primary key (id), constraint uniqueElemento unique (clave, nombre));
create table Trayectoria (id int(10) not null auto_increment, clave varchar(5) not null, alternativa tinyint(1) not null, condicion varchar(500), CasoUsoElementoid int(11) not null, finCasoUso tinyint(1) not null, primary key (id), constraint uniqueTrayectoria unique (clave, CasoUsoElementoid));
create table Atributo (id int(11) not null auto_increment, nombre varchar(200) not null, descripcion varchar(999) not null, obligatorio tinyint(1) not null, longitud int(10), formatoArchivo varchar(50), tamanioArchivo float, UnidadTamanioid int(10), EntidadElementoid int(11) not null, TipoDatoid int(10) not null, otroTipoDato varchar(45), primary key (id), constraint uniqueAtributo unique (nombre, EntidadElementoid));
create table TipoParametro (id int(11) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueTipoParametro unique (nombre));
create table CasoUso_ReglaNegocio (id int(10) not null auto_increment, numeroToken int(10) not null, CasoUsoElementoid int(11) not null, ReglaNegocioElementoid int(11) not null, primary key (id), constraint uniqueRelacionRN unique (CasoUsoElementoid, ReglaNegocioElementoid));
create table PostPrecondicion (id int(10) not null auto_increment, redaccion varchar(1000) not null, precondicion tinyint(1) not null, CasoUsoElementoid int(11) not null, primary key (id));
create table Inclusion (id int(10) not null auto_increment, CasoUsoElementoid_origen int(11) not null, CasoUsoElementoid_destino int(11) not null, primary key (id), constraint uniqueInclusion unique (CasoUsoElementoid_destino, CasoUsoElementoid_origen));
create table Extension (id int(10) not null auto_increment, CasoUsoElementoid_origen int(11) not null, CasoUsoElementoid_destino int(11) not null, causa varchar(999) not null, region varchar(500) not null, primary key (id), constraint uniqueExtension unique (CasoUsoElementoid_origen, CasoUsoElementoid_destino));
create table Paso (id int(10) not null auto_increment, numero int(10) not null, realizaActor tinyint(1) not null, redaccion varchar(1000) not null, Trayectoriaid int(10) not null, Verboid int(10) not null, otroVerbo varchar(45), primary key (id));
create table Entrada (id int(11) not null auto_increment, numeroToken int(10) not null, TipoParametroid int(11) not null, CasoUsoElementoid int(11) not null, Atributoid int(11), TerminoGlosarioElementoid int(11), primary key (id));
create table TipoReglaNegocio (id int(10) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueTipoReglaNegocio unique (nombre));
create table TipoAccion (id int(11) not null auto_increment, nombre varchar(45) not null, primary key (id), constraint uniqueTipoAccion unique (nombre));
create table Cardinalidad (id int(11) not null auto_increment, nombre varchar(10) not null, primary key (id), constraint uniqueCardinalidad unique (nombre));
create table Salida (id int(11) not null auto_increment, numeroToken int(11) not null, TipoParametroid int(11) not null, CasoUsoElementoid int(11) not null, MensajeElementoid int(11), TerminoGlosarioElementoid int(11), Atributoid int(11), primary key (id));
create table Accion (id int(11) not null auto_increment, PantallaElementoid int(11) not null, nombre varchar(45) not null, TipoAccionid int(11) not null, PantallaElementoidDestino int(11), imagen blob, descripcion varchar(999) not null, primary key (id));
create table CasoUso_Pantalla (id int(10) not null auto_increment, PantallaElementoid int(11) not null, CasoUsoElementoid int(11) not null, primary key (id), constraint uniqueRelacionPantalla unique (PantallaElementoid, CasoUsoElementoid));
create table CasoUso_Actor (id int(11) not null auto_increment, numeroToken int(11) not null, CasoUsoElementoid int(11) not null, ActorElementoid int(11) not null, primary key (id), constraint uniqueRelacionActor unique (CasoUsoElementoid, ActorElementoid));
create table ReglaNegocio (Elementoid int(11) not null, redaccion varchar(999) not null, TipoReglaNegocioid int(10) not null, Atributoid_unicidad int(11), Atributoid_fechaI int(11), Atributoid_fechaT int(11), TipoComparacionid int(10), Atributoid_comp1 int(11), Atributoid_comp2 int(11), Operadorid int(10), Atributoid_expReg int(11), expresionRegular varchar(100), primary key (Elementoid), constraint uniqueComparacion unique (TipoReglaNegocioid, Atributoid_comp1, Atributoid_comp2, Operadorid), constraint uniqueExpReg unique (TipoReglaNegocioid, Atributoid_expReg), constraint uniqueUnicidad unique (TipoReglaNegocioid, Atributoid_unicidad), constraint uniqueFechas unique (TipoReglaNegocioid, Atributoid_fechaI, Atributoid_fechaT));
create table Actor (otraCardinalidad varchar(45), Elementoid int(11) not null, Cardinalidadid int(11) not null, primary key (Elementoid));
create table CasoUso (Elementoid int(11) not null, redaccionActores varchar(1000), redaccionEntradas varchar(1000), redaccionSalidas varchar(1000), redaccionReglasNegocio varchar(1000), Moduloid int(11) not null, primary key (Elementoid));
create table Pantalla (Elementoid int(11) not null, imagen longblob, Moduloid int(11) not null, primary key (Elementoid));
create table TerminoGlosario (Elementoid int(11) not null, primary key (Elementoid));
create table Mensaje (Elementoid int(11) not null, redaccion varchar(999) not null, parametrizado tinyint(1) not null, primary key (Elementoid));
alter table Revision add index FKRevision175605 (Seccionid), add constraint FKRevision175605 foreign key (Seccionid) references Seccion (id) on update Cascade on delete Restrict;
alter table Accion add index FKAccion62036 (PantallaElementoidDestino), add constraint FKAccion62036 foreign key (PantallaElementoidDestino) references Pantalla (Elementoid);
alter table ReglaNegocio add index FKReglaNegoc900841 (Atributoid_expReg), add constraint FKReglaNegoc900841 foreign key (Atributoid_expReg) references Atributo (id) on update Cascade on delete Restrict;
alter table Parametro add index FKParametro572300 (Proyectoid), add constraint FKParametro572300 foreign key (Proyectoid) references Proyecto (id) on update Cascade on delete Cascade;
alter table Atributo add index FKAtributo234480 (UnidadTamanioid), add constraint FKAtributo234480 foreign key (UnidadTamanioid) references UnidadTamanio (id) on update Cascade on delete Restrict;
alter table ReferenciaParametro add index FKReferencia566006 (Trayectoriaid), add constraint FKReferencia566006 foreign key (Trayectoriaid) references Trayectoria (id) on update Cascade on delete Cascade;
alter table Accion add index FKAccion918990 (PantallaElementoid), add constraint FKAccion918990 foreign key (PantallaElementoid) references Pantalla (Elementoid) on update Cascade on delete Cascade;
alter table Actor add index FKActor872913 (Cardinalidadid), add constraint FKActor872913 foreign key (Cardinalidadid) references Cardinalidad (id) on update Cascade on delete Restrict;
alter table Accion add index FKAccion910670 (TipoAccionid), add constraint FKAccion910670 foreign key (TipoAccionid) references TipoAccion (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc564329 (TipoReglaNegocioid), add constraint FKReglaNegoc564329 foreign key (TipoReglaNegocioid) references TipoReglaNegocio (id) on update Cascade on delete Restrict;
alter table Mensaje add index FKMensaje721868 (Elementoid), add constraint FKMensaje721868 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table Pantalla add index FKPantalla491263 (Elementoid), add constraint FKPantalla491263 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table TerminoGlosario add index FKTerminoGlo98687 (Elementoid), add constraint FKTerminoGlo98687 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table Actor add index FKActor148309 (Elementoid), add constraint FKActor148309 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table ReglaNegocio add index FKReglaNegoc668056 (Elementoid), add constraint FKReglaNegoc668056 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table Entidad add index FKEntidad434647 (Elementoid), add constraint FKEntidad434647 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table Atributo add index FKAtributo539266 (EntidadElementoid), add constraint FKAtributo539266 foreign key (EntidadElementoid) references Entidad (Elementoid) on update Cascade on delete Cascade;
alter table CasoUso add index FKCasoUso589849 (Elementoid), add constraint FKCasoUso589849 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table CasoUso_Actor add index FKCasoUso_Ac644128 (CasoUsoElementoid), add constraint FKCasoUso_Ac644128 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table CasoUso_Actor add index FKCasoUso_Ac543005 (ActorElementoid), add constraint FKCasoUso_Ac543005 foreign key (ActorElementoid) references Actor (Elementoid) on update Cascade on delete Restrict;
alter table CasoUso_Pantalla add index FKCasoUso_Pa531997 (CasoUsoElementoid), add constraint FKCasoUso_Pa531997 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table CasoUso_Pantalla add index FKCasoUso_Pa280704 (PantallaElementoid), add constraint FKCasoUso_Pa280704 foreign key (PantallaElementoid) references Pantalla (Elementoid) on update Cascade on delete Restrict;
alter table Salida add index FKSalida348357 (Atributoid), add constraint FKSalida348357 foreign key (Atributoid) references Atributo (id) on update Cascade on delete Restrict;
alter table Salida add index FKSalida684176 (TerminoGlosarioElementoid), add constraint FKSalida684176 foreign key (TerminoGlosarioElementoid) references TerminoGlosario (Elementoid) on update Cascade on delete Restrict;
alter table Salida add index FKSalida506056 (CasoUsoElementoid), add constraint FKSalida506056 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table Salida add index FKSalida666681 (MensajeElementoid), add constraint FKSalida666681 foreign key (MensajeElementoid) references Mensaje (Elementoid) on update Cascade on delete Restrict;
alter table Entrada add index FKEntrada429579 (Atributoid), add constraint FKEntrada429579 foreign key (Atributoid) references Atributo (id) on update Cascade on delete Restrict;
alter table Entrada add index FKEntrada368636 (TerminoGlosarioElementoid), add constraint FKEntrada368636 foreign key (TerminoGlosarioElementoid) references TerminoGlosario (Elementoid) on update Cascade on delete Restrict;
alter table Entrada add index FKEntrada546756 (CasoUsoElementoid), add constraint FKEntrada546756 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table Extension add index FKExtension742233 (CasoUsoElementoid_origen), add constraint FKExtension742233 foreign key (CasoUsoElementoid_origen) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table Extension add index FKExtension285262 (CasoUsoElementoid_destino), add constraint FKExtension285262 foreign key (CasoUsoElementoid_destino) references CasoUso (Elementoid) on update Cascade on delete Restrict;
alter table Inclusion add index FKInclusion776033 (CasoUsoElementoid_destino), add constraint FKInclusion776033 foreign key (CasoUsoElementoid_destino) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table Inclusion add index FKInclusion168061 (CasoUsoElementoid_origen), add constraint FKInclusion168061 foreign key (CasoUsoElementoid_origen) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table PostPrecondicion add index FKPostPrecon986728 (CasoUsoElementoid), add constraint FKPostPrecon986728 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table CasoUso_ReglaNegocio add index FKCasoUso_Re422554 (CasoUsoElementoid), add constraint FKCasoUso_Re422554 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table CasoUso_ReglaNegocio add index FKCasoUso_Re477864 (ReglaNegocioElementoid), add constraint FKCasoUso_Re477864 foreign key (ReglaNegocioElementoid) references ReglaNegocio (Elementoid) on update Cascade on delete Restrict;
alter table Salida add index FKSalida442060 (TipoParametroid), add constraint FKSalida442060 foreign key (TipoParametroid) references TipoParametro (id) on update Cascade on delete Restrict;
alter table Entrada add index FKEntrada610752 (TipoParametroid), add constraint FKEntrada610752 foreign key (TipoParametroid) references TipoParametro (id) on update Cascade on delete Restrict;
alter table Trayectoria add index FKTrayectori243052 (CasoUsoElementoid), add constraint FKTrayectori243052 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table Paso add index FKPaso747799 (Trayectoriaid), add constraint FKPaso747799 foreign key (Trayectoriaid) references Trayectoria (id) on update Cascade on delete Cascade;
alter table Revision add index FKRevision761293 (CasoUsoElementoid), add constraint FKRevision761293 foreign key (CasoUsoElementoid) references CasoUso (Elementoid) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia203453 (Atributoid), add constraint FKReferencia203453 foreign key (Atributoid) references Atributo (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia384626 (TipoParametroid), add constraint FKReferencia384626 foreign key (TipoParametroid) references TipoParametro (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia209681 (PostPrecondicionid), add constraint FKReferencia209681 foreign key (PostPrecondicionid) references PostPrecondicion (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia233904 (Pasoid), add constraint FKReferencia233904 foreign key (Pasoid) references Paso (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia97972 (Extensionid), add constraint FKReferencia97972 foreign key (Extensionid) references Extension (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia564326 (PasoidDestino), add constraint FKReferencia564326 foreign key (PasoidDestino) references Paso (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia551912 (ElementoidDestino), add constraint FKReferencia551912 foreign key (ElementoidDestino) references Elemento (id) on update Cascade on delete Cascade;
alter table ReferenciaParametro add index FKReferencia742226 (AccionidDestino), add constraint FKReferencia742226 foreign key (AccionidDestino) references Accion (id) on update Cascade on delete Cascade;
alter table Atributo add index FKAtributo156815 (TipoDatoid), add constraint FKAtributo156815 foreign key (TipoDatoid) references TipoDato (id) on update Cascade on delete Restrict;
alter table Paso add index FKPaso790455 (Verboid), add constraint FKPaso790455 foreign key (Verboid) references Verbo (id) on update Cascade on delete Restrict;
alter table Elemento add index FKElemento728649 (Proyectoid), add constraint FKElemento728649 foreign key (Proyectoid) references Proyecto (id);
alter table Elemento add index FKElemento378533 (EstadoElementoid), add constraint FKElemento378533 foreign key (EstadoElementoid) references EstadoElemento (id) on update Cascade on delete Cascade;
alter table Colaborador_Proyecto add index FKColaborado926222 (Proyectoid), add constraint FKColaborado926222 foreign key (Proyectoid) references Proyecto (id) on update Cascade on delete Cascade;
alter table Colaborador_Proyecto add index FKColaborado523143 (ColaboradorCURP), add constraint FKColaborado523143 foreign key (ColaboradorCURP) references Colaborador (CURP) on update Cascade on delete Cascade;
alter table Colaborador_Proyecto add index FKColaborado664150 (Rolid), add constraint FKColaborado664150 foreign key (Rolid) references Rol (id) on update Cascade on delete Cascade;
alter table Modulo add index FKModulo19143 (Proyectoid), add constraint FKModulo19143 foreign key (Proyectoid) references Proyecto (id) on update Cascade on delete Cascade;
alter table CasoUso add index FKCasoUso686967 (Moduloid), add constraint FKCasoUso686967 foreign key (Moduloid) references Modulo (id) on update Cascade on delete Cascade;
alter table Pantalla add index FKPantalla768080 (Moduloid), add constraint FKPantalla768080 foreign key (Moduloid) references Modulo (id) on update Cascade on delete Cascade;
alter table Telefono add index FKTelefono558597 (ColaboradorCURP), add constraint FKTelefono558597 foreign key (ColaboradorCURP) references Colaborador (CURP) on update Cascade on delete Cascade;
alter table Proyecto add index FKProyecto676367 (EstadoProyectoid), add constraint FKProyecto676367 foreign key (EstadoProyectoid) references EstadoProyecto (id) on update Cascade on delete Restrict;
alter table Actualizacion add index FKActualizac954409 (Elementoid), add constraint FKActualizac954409 foreign key (Elementoid) references Elemento (id) on update Cascade on delete Cascade;
alter table Actualizacion add index FKActualizac741555 (Colaborador_Proyectoid), add constraint FKActualizac741555 foreign key (Colaborador_Proyectoid) references Colaborador_Proyecto (id) on update Cascade on delete Cascade;
alter table ReglaNegocio add index FKReglaNegoc669584 (Atributoid_unicidad), add constraint FKReglaNegoc669584 foreign key (Atributoid_unicidad) references Atributo (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc184874 (Atributoid_fechaI), add constraint FKReglaNegoc184874 foreign key (Atributoid_fechaI) references Atributo (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc184863 (Atributoid_fechaT), add constraint FKReglaNegoc184863 foreign key (Atributoid_fechaT) references Atributo (id);
alter table ReglaNegocio add index FKReglaNegoc982004 (TipoComparacionid), add constraint FKReglaNegoc982004 foreign key (TipoComparacionid) references TipoComparacion (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc263949 (Operadorid), add constraint FKReglaNegoc263949 foreign key (Operadorid) references Operador (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc476000 (Atributoid_comp1), add constraint FKReglaNegoc476000 foreign key (Atributoid_comp1) references Atributo (id) on update Cascade on delete Restrict;
alter table ReglaNegocio add index FKReglaNegoc475999 (Atributoid_comp2), add constraint FKReglaNegoc475999 foreign key (Atributoid_comp2) references Atributo (id) on update Cascade on delete Restrict;
alter table Mensaje_Parametro add index FKMensaje_Pa262782 (MensajeElementoid), add constraint FKMensaje_Pa262782 foreign key (MensajeElementoid) references Mensaje (Elementoid) on update Cascade on delete Cascade;
alter table Mensaje_Parametro add index FKMensaje_Pa138078 (Parametroid), add constraint FKMensaje_Pa138078 foreign key (Parametroid) references Parametro (id) on update Cascade on delete Restrict;
