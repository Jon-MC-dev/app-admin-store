import 'package:app4/src/widgets/color_predominante.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:palette_generator/palette_generator.dart';

class VentasPage extends KFDrawerContent {
  @override
  _VentasPage createState() => _VentasPage();
}

class _VentasPage extends State<VentasPage> {
  @override
  Widget build(BuildContext context) {
    //_updatePaletteGenerator();
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            IconoMenu(widgetMenu: widget),
            TituloWidget(
              texto: "Ventas",
            ),
            ColorPredominante(
              imajen: AssetImage('lib/src/assets/img/tiendaa.jpg'),
            )
          ],
        ),
      ),
    );
  }
}
