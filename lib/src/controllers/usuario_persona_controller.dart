import 'dart:convert';

import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
import 'package:app4/src/models/usuario_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/usuario_persona_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioPersonaController extends AbstractController {
  @override
  ProviderAbs modelProvider = PersonaUsuarioProvider();
  @override
  RecursosDatos modelDataSource = PersonaUsuarioDataSource();
  @override
  ModelAbs objModel = new PersonaUsuario();
  @override
  Function funcionExtraEnValidando;

  RxString seleccion = 'Seleccionar'.obs;
  RxString msSexo = ''.obs;
  RxBool textoOculto = true.obs;
  RxList<dynamic> column = [].obs;
  Rx<Icon> iconoOjo = Icon(
    Icons.remove_red_eye,
    color: Color(0xFF008065),
  ).obs;
  //String strTotal = 'Total';
  String strMarcas = 'Marcas';
  String strCategoria = 'Categoria';
  String strProductos = 'Productos';
  String strUsuarios = 'Usuarios';
  String strVentas = 'Ventas';
  String strAdquisiciones = 'Adquisiciones';

  //RxBool rxbTotal = false.obs;
  RxBool rxbMarcas = false.obs;
  RxBool rxbCategoria = false.obs;
  RxBool rxbProductos = false.obs;
  RxBool rxbUsuarios = false.obs;
  RxBool rxbVentas = false.obs;
  RxBool rxbAdquisiciones = false.obs;

  @override
  Future<bool> addData() async {
    PersonaUsuario objMod =
        PersonaUsuario(persona: new Persona(), usuario: new Usuario());
    objMod = objMod.deJsonAObj(getAllValues());
    Map<String, String> objPermisos = {};
    if (rxbMarcas.value) objPermisos['Marcas'] = 'Ok';
    if (rxbCategoria.value) objPermisos['Categoria'] = 'Ok';
    if (rxbProductos.value) objPermisos['Productos'] = 'Ok';
    if (rxbUsuarios.value) objPermisos['Usuarios'] = 'Ok';
    if (rxbVentas.value) objPermisos['Ventas'] = 'Ok';
    if (rxbAdquisiciones.value) objPermisos['Adquisiciones'] = 'Ok';
    print(objPermisos);
    objMod.usuario.permisos = json.encode(objPermisos);
    objMod.persona.sexo = seleccion.value;
    print(objMod.persona.getDataJson());
    print(objMod.usuario.getDataJson());
    return modelProvider.addData(objMod);
  }

  @override
  deteleData() {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list =
        await modelProvider.getData(model: PersonaUsuario()..id = id);
    return list.cast<PersonaUsuario>();
  }

  @override
  Future<bool> saveChanges() async {
    return false;
  }

  @override
  void onInit() {
    this.controllersInputs['nombre'] = new TextEditingController();
    this.controllersInputs['apellido_paterno'] = new TextEditingController();
    this.controllersInputs['apellido_materno'] = new TextEditingController();
    this.controllersInputs['fechaNaci'] = new TextEditingController();
    //this.controllersInputs['sexo'] = new TextEditingController();
    this.controllersInputs['usuario'] = new TextEditingController();
    this.controllersInputs['contrasena'] = new TextEditingController();

    seleccion.listen((String val) {
      if (seleccion.value == "Seleccionar") {
        msSexo.value = "Seleccionar sexo";
      } else {
        msSexo.value = "";
      }
    });
    funcionExtraEnValidando = () {
      if (seleccion.value == "Seleccionar") {
        msSexo.value = "Seleccionar sexo";
        return false;
      } else {
        return true;
      }
    };

    textoOculto.listen((bool visibilidad) {
      if (!visibilidad) {
        iconoOjo.value = Icon(
          Icons.remove_red_eye_outlined,
          color: Color(0xFF008065),
        );
      } else {
        iconoOjo.value = Icon(
          Icons.remove_red_eye,
          color: Color(0xFF008065),
        );
      }
    });
    super.onInit();
  }

  String reglas1(String valor) {
    v.listaReglas.clear();
    v.listaReglas.add(v.esVacio(valor, "El campo esta vacio"));
    v.listaReglas.add(v.valorMinimo(valor, "El texto es muy corto", 2));
    v.listaReglas
        .add(v.soloLetrasConEspacios(valor, "Solo puede haber letras"));

    return v.evaluarReglas();
  }

  String seleccionFecha(String valor) {
    v.listaReglas.clear();
    v.listaReglas.add(v.esVacio(valor, "Seleccione una fecha"));
    print(v.evaluarReglas());
    return v.evaluarReglas();
  }

  String reglaContrasena(String valor) {
    v.listaReglas.clear();
    v.listaReglas.add(v.esVacio(valor, "La contraseña es requerida"));
    v.listaReglas.add(v.valorMinimo(valor, "Minimo 8 caracteres", 8));
    v.listaReglas.add(v.soloLetrasNumerosEspacios(
        valor, "Solo puede haber letras y numeros"));

    return v.evaluarReglas();
  }

  void getDataEdit() async {
    List<ModelAbs> datos = await this.getData(id: objModel.id);
    print("Datos de edicion");
    print(datos.length);
    if (datos.length >= 1) {
      PersonaUsuario datosPeUser = datos[0];
      this.controllersInputs['nombre'].text = datosPeUser.persona.nombre;
      this.controllersInputs['apellido_paterno'].text =
          datosPeUser.persona.apellidoMaterno;
      this.controllersInputs['apellido_materno'].text =
          datosPeUser.persona.apellidoPaterno;
      this.controllersInputs['fechaNaci'].text = datosPeUser.persona.fechaNaci;
      this.seleccion.value = datosPeUser.persona.sexo;

      this.controllersInputs['usuario'].text = datosPeUser.usuario.usuario;
      this.controllersInputs['contrasena'].text =
          datosPeUser.usuario.contrasena;

      var permisos = json.decode(datosPeUser.usuario.permisos);
      print(permisos);
      var keysPermisos = permisos.keys;
      print(keysPermisos);
      for (var key in keysPermisos) {
        print(key == 'Marcas');
        if (key == strMarcas) rxbMarcas.value = true;
        if (key == strCategoria) rxbCategoria.value = true;
        if (key == strProductos) rxbProductos.value = true;
        if (key == strUsuarios) rxbUsuarios.value = true;
        if (key == strVentas) rxbVentas.value = true;
        if (key == strAdquisiciones) rxbAdquisiciones.value = true;
      }
    }
  }

  @override
  void cleanForm() {
    this.resetInputs(funcionExtra: () {
      this.seleccion.value = 'Seleccionar';
    });
  }
}
