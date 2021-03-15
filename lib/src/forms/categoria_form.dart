import 'package:app4/src/controllers/categoria_controller.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class FormCategoria extends StatelessWidget {
  final CategoriaController c = Get.put(CategoriaController());
  @override
  Widget build(BuildContext context) {
    print("FormCategoria: accion");
    print("${c.accion}");
    return Form(
      key: c.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampoTexto(
            label: 'Categoria',
            validador: c.validarInput,
            controllerText: c.controllersInputs['categoriaNombre'],
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar Categoria"),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
