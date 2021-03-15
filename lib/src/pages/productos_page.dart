import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';

class ProductosPage extends KFDrawerContent {
  @override
  _ProductosPage createState() => _ProductosPage();
}

class _ProductosPage extends State<ProductosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            IconoMenu(widgetMenu: widget),
            TituloWidget(
              texto: "Productos",
            )
          ],
        ),
      ),
    );
  }
}
