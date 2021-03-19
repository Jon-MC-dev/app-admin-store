import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
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
  RxString seleccion = 'Seleccionar'.obs;

  @override
  Future<bool> addData() async {
    return false;
  }

  @override
  deteleData() {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list =
        await modelProvider.getData(model: PersonaUsuario()..id = id);
    return list.cast<PersonaUsuario>();
  }

  String reglas1(String valor) {
    v.listaReglas.clear();
    v.listaReglas.add(v.esVacio(valor, "El campo esta vacio"));
    v.listaReglas.add(v.valorMinimo(valor, "El texto es muy corto", 2));
    v.listaReglas
        .add(v.soloLetrasConEspacios(valor, "Solo puede haber letras"));

    return v.evaluarReglas();
  }

  @override
  Future<bool> saveChanges() async {
    return true;
  }

  @override
  void onInit() {
    this.controllersInputs['nombre'] = new TextEditingController();
    this.controllersInputs['apellidoP'] = new TextEditingController();
    this.controllersInputs['apellidoM'] = new TextEditingController();
    this.controllersInputs['fechaNac'] = new TextEditingController();
    this.controllersInputs['sexo'] = new TextEditingController();
    this.controllersInputs['usuario'] = new TextEditingController();
    this.controllersInputs['contrasena'] = new TextEditingController();
    super.onInit();
  }
}
