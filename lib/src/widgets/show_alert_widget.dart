import 'package:flutter/material.dart';

class AlertPersonalizable extends StatelessWidget {
  Widget titulo;
  Widget contenido;
  List<Widget> acciones;

  AlertPersonalizable({this.titulo, this.contenido, this.acciones});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: this.titulo, content: this.contenido, actions: this.acciones);
  }
}
