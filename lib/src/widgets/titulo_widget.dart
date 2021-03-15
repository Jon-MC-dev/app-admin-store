import 'package:flutter/material.dart';

class TituloWidget extends StatelessWidget {
  String texto;
  TituloWidget({this.texto});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            this.texto,
            style: TextStyle(fontSize: 25.0),
          ),
        )
      ],
    );
  }
}
