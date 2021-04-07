import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  TextEditingController controllerText;
  Function validador;
  String label;
  TextInputType tipo;
  Function funcion;
  String textoInicial;
  bool textoOculto;
  bool habilitado;
  Widget suffixIcon;
  int maxLines;
  int maxLength;
  CampoTexto(
      {this.label,
      this.controllerText,
      this.validador,
      this.tipo = TextInputType.text,
      this.funcion,
      this.textoInicial,
      this.habilitado = true,
      this.textoOculto = false,
      this.maxLines = 1,
      this.maxLength = 25,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: this.funcion,
      keyboardType: this.tipo,
      initialValue: this.textoInicial,
      controller: this.controllerText,
      enabled: this.habilitado,
      cursorColor: Color(0xFF008065),
      maxLength: maxLength,
      maxLines: maxLines,
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
