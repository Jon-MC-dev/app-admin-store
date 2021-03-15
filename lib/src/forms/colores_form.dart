import 'package:app4/src/controllers/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FormColores extends StatelessWidget {
  final ColorController c = Get.put(ColorController());
  final Color pickerColor = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    print("FormColores: accion");
    print("${c.accion}");
    return Form(
      key: c.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CampoTexto(
            label: 'Nombre del color',
          ),
          ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (Color color) {},
          ),
          Text(
            "Selecciona un color: ",
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: c.validarOnSubmit,
            child: Text("Guardar Color"),
            color: Colors.green,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
