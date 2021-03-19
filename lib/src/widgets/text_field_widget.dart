import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController controllerText;
  Function validador;
  String label;
  TextInputType tipo;
  Function funcion;
  String textoInicial;
  bool textoOculto;
  Widget suffixIcon;
  CampoTexto(
      {this.label,
      this.controllerText,
      this.validador,
      this.tipo = TextInputType.text,
      this.funcion,
      this.textoInicial,
      this.textoOculto = false,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: this.funcion,
      keyboardType: this.tipo,
      initialValue: this.textoInicial,
      controller: this.controllerText,
      cursorColor: Color(0xFF008065),
      maxLength: 25,
      obscureText: this.textoOculto,
      validator: this.validador,
      decoration: InputDecoration(
          suffixIcon: this.suffixIcon,
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
