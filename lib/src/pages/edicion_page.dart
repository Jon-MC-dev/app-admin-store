import 'package:flutter/material.dart';
import 'package:app4/src/widgets/titulo_widget.dart';

class EdicionPagina extends StatelessWidget {
  Widget formulario;
  String pagina;
  bool editar = false;
  EdicionPagina({this.formulario, this.pagina, this.editar = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
              child: Column(children: [
            //IconoMenu(widgetMenu: widget),
            Row(children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]),
            TituloWidget(
              texto: "${editar ? "Editar" : "Agregar"} ${this.pagina}",
            ),

            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                //color: Colors.redAccent,
                child: this.formulario)
          ])),
        ),
      ),
    );
  }
}
