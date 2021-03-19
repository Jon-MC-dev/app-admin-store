import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
import 'package:app4/src/models/usuario_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/usuario_persona_providers.dart';
import 'package:custom_switch/custom_switch.dart';
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
  Rx<Icon> iconoOjo = Icon(
    Icons.remove_red_eye,
    color: Color(0xFF008065),
  ).obs;
  List<Column> customsSwitchs = <Column>[];
  List<String> nombresSwitchs = [
    'Total',
    'Marcas',
    'Categoria',
    'Productos',
    'Usuarios',
    'Ventas',
    'Adquisiciones'
  ];

  @override
  Future<bool> addData() async {
    PersonaUsuario objMod =
        PersonaUsuario(persona: new Persona(), usuario: new Usuario());
    objMod = objMod.deJsonAObj(getAllValues());
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
    return true;
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
      print("El valor de Seleccion[$val]");
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

    nombresSwitchs.forEach((element) {
      customsSwitchs.add(Column(
        children: [
          CustomSwitch(
            activeColor: Color(0xFF008065),
            value: false,
            onChanged: (value) {},
          ),
          Text(element)
        ],
      ));
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
}
