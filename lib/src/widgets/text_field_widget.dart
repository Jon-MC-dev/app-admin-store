import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController controllerText;
  Function validador;
  String label;
  CampoTexto({this.label, this.controllerText, this.validador});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controllerText,
      cursorColor: Color(0xFF008065),
      maxLength: 25,
      validator: this.validador,
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(
            color: Color(0xFF008065),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF008065), width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          )
          // border: OutlineInputBorder(
          //     borderSide: BorderSide(color: Color(0xFF008065))),
          ),
    );
  }
}
