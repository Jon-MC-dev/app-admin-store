import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:app4/src/widgets/icono_menu_widget.dart';
import 'package:app4/src/widgets/titulo_widget.dart';
import 'package:palette_generator/palette_generator.dart';

class VentasPage extends KFDrawerContent {
  @override
  _VentasPage createState() => _VentasPage();
}

const Color _kBackgroundColor = Color(0xffa0a0a0);
const Color _kSelectionRectangleBackground = Color(0x15000000);
const Color _kSelectionRectangleBorder = Color(0x80000000);
const Color _kPlaceholderColor = Color(0x80404040);

class _VentasPage extends State<VentasPage> {
  PaletteGenerator paletteGenerator;

  @override
  Widget build(BuildContext context) {
    _updatePaletteGenerator();
    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            IconoMenu(widgetMenu: widget),
            TituloWidget(
              texto: "Ventas",
            ),
            Positioned.fromRect(
                rect: Rect.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: _kSelectionRectangleBackground,
                      border: Border.all(
                        width: 1.0,
                        color: _kSelectionRectangleBorder,
                        style: BorderStyle.solid,
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage('lib/src/assets/img/tiendaa.jpg'),
      maximumColorCount: 20,
    );
    setState(() {});
  }
}
