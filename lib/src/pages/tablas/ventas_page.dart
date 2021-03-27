import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';
import 'package:app4/src/widgets/titulo_widget.dart';

class VentasPage extends KFDrawerContent {
  @override
  _VentasPage createState() => _VentasPage();
}

class _VentasPage extends State<VentasPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            IconoMenu(widgetMenu: widget),
            TituloWidget(
              texto: "Ventas",
            )
          ],
        ),
      ),
    );
  }
}