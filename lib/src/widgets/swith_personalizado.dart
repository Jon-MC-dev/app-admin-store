import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';

class SwitchPersonalizado extends StatefulWidget {
  final String texto;
  bool valor;
  SwitchPersonalizado({this.texto, this.valor});

  @override
  _SwitchPersonalizadoState createState() => _SwitchPersonalizadoState();
}

class _SwitchPersonalizadoState extends State<SwitchPersonalizado> {
  @override
  Widget build(BuildContext context) {
    //print("Redibujando [${widget.texto}] ${this.widget.valor}");
    return Column(
      children: [
        CustomSwitch(
          activeColor: Color(0xFF008065),
          value: this.widget.valor,
          onChanged: (value) {
            setState(() {
              this.widget.valor = value;
            });
          },
        ),
        Text(this.widget.texto)
      ],
    );
  }
}
