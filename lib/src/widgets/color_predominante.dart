import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorPredominante extends StatelessWidget {
  final ImageProvider<Object> imajen;
  ColorPredominante({@required this.imajen, this.onChange});
  void Function(Color color) onChange;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: obtenerColores(),
        builder:
            (BuildContext context, AsyncSnapshot<PaletteGenerator> snapshot) {
          if (snapshot.hasData) {
            print(
                "Numero de containers a generar: [${snapshot.data.colors.length}]");
            List<Widget> containers = <Widget>[];
            for (var color in snapshot.data.colors) {
              containers.add(InkWell(
                onTap: () {
                  if (onChange != null) onChange(color);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(2.0),
                  width: 50,
                  height: 50,
                ),
              ));
            }
            return Wrap(
              children: containers,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Future<PaletteGenerator> obtenerColores() async {
    return await PaletteGenerator.fromImageProvider(
      imajen,
      maximumColorCount: 25,
    );
  }
}
