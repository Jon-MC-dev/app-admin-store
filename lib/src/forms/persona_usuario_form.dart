import 'package:app4/src/controllers/usuario_persona_controller.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class FormPersonaUsuario extends StatelessWidget {
  final UsuarioPersonaController c = Get.put(UsuarioPersonaController());

  @override
  Widget build(BuildContext context) {
    print("FormCategoria: accion");
    print("${c.accion}");
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
            controllerText: c.controllersInputs['apellidoP'],
            validador: c.reglas1,
          ),
          CampoTexto(
            label: 'Apellido Materno',
            controllerText: c.controllersInputs['apellidoM'],
            validador: c.reglas1,
          ),
          Row(
            children: [
              Flexible(
                child: CampoTexto(
                  label: 'Fecha Nacimiento',
                  controllerText: c.controllersInputs['fechaNac'],
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
          CampoTexto(
            label: 'Contraseña',
            controllerText: c.controllersInputs['contrasena'],
            validador: c.reglaContrasena,
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
    TextEditingController fechInput = c.controllersInputs['fechaNac'];
    fechInput.text = "${picked.toLocal()}".split(' ')[0];
  }
}
