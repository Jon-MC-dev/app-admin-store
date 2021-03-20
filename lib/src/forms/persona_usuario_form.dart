import 'package:app4/src/controllers/usuario_persona_controller.dart';
import 'package:app4/src/widgets/swith_personalizado.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class FormPersonaUsuario extends StatelessWidget {
  final UsuarioPersonaController c = Get.put(UsuarioPersonaController());

  @override
  Widget build(BuildContext context) {
    print("FormCategoria: accion");
    print("${c.accion}");
    if (c.accion == c.saveChanges) {
      c.getDataEdit();
    }
    c.rxbMarcas.value = false;
    c.rxbCategoria.value = false;
    c.rxbProductos.value = false;
    c.rxbUsuarios.value = false;
    c.rxbVentas.value = false;
    c.rxbAdquisiciones.value = false;

    c.cleanForm();
    return Form(
      key: c.formKey,
      child: Column(
        children: [
          CampoTexto(
            label: 'Nombre',
            controllerText: c.controllersInputs['nombre'],
            validador: c.reglas1,
          ),
          CampoTexto(
            label: 'Apellido Paterno',
            controllerText: c.controllersInputs['apellido_paterno'],
            validador: c.reglas1,
          ),
          CampoTexto(
            label: 'Apellido Materno',
            controllerText: c.controllersInputs['apellido_materno'],
            validador: c.reglas1,
          ),
          Row(
            children: [
              Flexible(
                child: CampoTexto(
                  label: 'Fecha Nacimiento',
                  //habilitado: false,
                  controllerText: c.controllersInputs['fechaNaci'],
                  validador: c.seleccionFecha,
                  tipo: TextInputType.datetime,
                  funcion: () {
                    _selectDate(context);
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: Column(
                children: [
                  Obx(() {
                    return DropdownButton<String>(
                      value: c.seleccion.value,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 25,
                      style: TextStyle(color: Color(0xFF008065)),
                      underline: Container(
                        height: 2,
                        color: Color(0xFF008065),
                      ),
                      onChanged: (String newValue) {
                        c.seleccion.value = newValue;
                      },
                      items: <String>[
                        'Seleccionar',
                        'Mujer',
                        'Hombre',
                        'Prefiero no decirlo'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  }),
                  Obx(() {
                    return Text(
                      c.msSexo.value,
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    );
                  })
                ],
              )),
            ],
          ),
          CampoTexto(
            label: 'Usuario',
            controllerText: c.controllersInputs['usuario'],
            validador: c.reglas1,
          ),
          Obx(() {
            return CampoTexto(
              suffixIcon: IconButton(
                  icon: c.iconoOjo.value,
                  onPressed: () {
                    c.textoOculto.value = !c.textoOculto.value;
                  }),
              textoOculto: c.textoOculto.value,
              label: 'Contraseña',
              controllerText: c.controllersInputs['contrasena'],
              validador: c.reglaContrasena,
            );
          }),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() {
                    return _switchPersonalizados(
                        texto: c.strMarcas, valor: c.rxbMarcas);
                  }),
                  Obx(() {
                    print("Ha cambiado 2");
                    return _switchPersonalizados(
                        texto: c.strCategoria, valor: c.rxbCategoria);
                  }),
                  Obx(() {
                    return _switchPersonalizados(
                        texto: c.strProductos, valor: c.rxbProductos);
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() {
                    return _switchPersonalizados(
                        texto: c.strUsuarios, valor: c.rxbUsuarios);
                  }),
                  Obx(() {
                    return _switchPersonalizados(
                        texto: c.strVentas, valor: c.rxbVentas);
                  }),
                  Obx(() {
                    return _switchPersonalizados(
                        texto: c.strAdquisiciones, valor: c.rxbAdquisiciones);
                  })
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar"),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );
    TextEditingController fechInput = c.controllersInputs['fechaNaci'];
    if (picked != null) {
      fechInput.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Widget _switchPersonalizados({String texto, RxBool valor}) {
    return Column(
      children: [
        Switch(
          activeColor: Color(0xFF008065),
          value: valor.value,
          onChanged: (value) {
            valor.value = value;
          },
        ),
        Text(texto)
      ],
    );
  }
}
