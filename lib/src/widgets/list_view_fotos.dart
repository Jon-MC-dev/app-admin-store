import 'dart:io';

import 'package:app4/src/providers/color_providers.dart';
import 'package:app4/src/models/color_model.dart' as C;
import 'package:app4/src/widgets/color_predominante.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class ListFotos extends StatelessWidget {
  RxList _listaFotos = <Widget>[].obs;
  RxInt _radioValue = 0.obs;

  final List<DropdownMenuItem> colores = [];
  Rx<Color> pickerColor = (Colors.black).obs;
  final picker = ImagePicker();

  ListFotos() {
    print("Re Echo");

    ColorProvider().getData(model: C.Color()..id = 0).then((lista) {
      lista.forEach((element) {
        C.Color color = element;
        colores.add(DropdownMenuItem(
          child: Text(color.color),
          value: color.id,
        ));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        //color: Colors.blue[300],
        height: _listaFotos.isEmpty ? 50 : Get.height * 0.28,
        child: Column(
          children: [
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      this.addTargeta(context);
                    },
                    icon: Icon(Icons.camera_outlined),
                    label: Text('Agregar fotografia'))
              ],
            ),
            Expanded(
              child: Obx(() {
                return ListView(
                    scrollDirection: Axis.horizontal,
                    children: _listaFotos.toList());
              }),
            ),
          ],
        ),
      );
    });
  }

  void addTargeta(BuildContext context) {
    Widget targeta;
    Rx<Icon> icono;
    Rx<FileImage> imagenFile = FileImage(File('null')).obs;
    icono = Icon(
      Icons.color_lens,
      size: 30.0,
    ).obs;
    targeta = Obx(() {
      return Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(30),
            image: imagenFile.value.file != null
                ? DecorationImage(image: imagenFile.value, fit: BoxFit.cover)
                : null),
        margin: EdgeInsets.only(right: 15.0),
        width: 160.0,
        child: Container(
          child: Stack(
            children: [
              Container(
                //color: Colors.blue,
                constraints: BoxConstraints.expand(),
                child: IconButton(
                  icon: Icon(
                    Icons.photo_camera_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    this.getImage(imagenFile);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: icono.value,
                      onPressed: () {
                        showColorPiker(context, icono, imagenFile.value);
                      }),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print("Removeremos la targeta");
                      _listaFotos.remove(targeta);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
    _listaFotos.add(targeta);
  }

  void showColorPiker(
      BuildContext context, Rx<Icon> icono, ImageProvider<Object> imagen) {
    Widget colorPredominante = ColorPredominante(
      imajen: imagen,
      onChange: (Color color) {
        pickerColor.value = color;
      },
    );
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles'),
          content: SingleChildScrollView(child: Obx(() {
            List<Widget> widget = _radioValue.value == 0
                ? [
                    SearchableDropdown.single(
                      items: colores,
                      underline: Container(
                        height: 1.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF008065),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          //borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      value: 0,
                      onChanged: (valor) {
                        print(valor);
                      },
                      hint: "Selecciona un color",
                      searchHint: "Selecciona un color",
                      isExpanded: true,
                    )
                  ]
                : [
                    Container(
                      width: 500,
                      height: 400,
                      child: PageView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Colores predominantes",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                colorPredominante,
                                Container(
                                  margin: EdgeInsets.all(25.0),
                                  width: 50,
                                  height: 50,
                                  color: pickerColor.value,
                                ),
                              ],
                            ),
                          ),
                          ColorPicker(
                            pickerColor: pickerColor.value,
                            showLabel: true,
                            pickerAreaHeightPercent: 0.8,
                            onColorChanged: (Color value) {
                              pickerColor.value = value;
                            },
                          )
                        ],
                      ),
                    ),
                    CampoTexto(
                      label: 'Nombre del color',
                    ),
                  ];

            return Column(
              children: [
                ListTile(
                  title: Text('Existente'),
                  leading: Radio(
                    value: 0,
                    groupValue: _radioValue.value,
                    onChanged: cambioValor,
                  ),
                ),
                ListTile(
                  title: Text('Nuevo'),
                  leading: Radio(
                    value: 1,
                    groupValue: _radioValue.value,
                    onChanged: cambioValor,
                  ),
                ),
                ...widget
              ],
            );
          })),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Aceptar'),
              color: Colors.blue[400],
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                if (_radioValue.value == 0) {
                } else {
                  print("Hola WE");
                  icono.value = Icon(
                    Icons.color_lens,
                    color: pickerColor.value,
                    size: 30.0,
                  );
                  print(pickerColor.value);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void cambioValor(int value) {
    _radioValue.value = value;
  }

  Future getImage(Rx<FileImage> imagenArchivo) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print("imagenArchivo.value = FileImage(File(pickedFile.path));");
      imagenArchivo.value = FileImage(File(pickedFile.path));
    } else {
      print('No imagen.');
    }
    print("WE YA seleccione la imajen");
  }
}
