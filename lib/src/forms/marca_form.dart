import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:app4/src/controllers/marca_controller.dart';
import 'package:get/get.dart';

class FormMarca extends StatelessWidget {
  final MarcaController c = Get.put(MarcaController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampoTexto(
            label: 'Marca',
            validador: c.validarInput,
            controllerText: c.marcaController,
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar Marca"),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
