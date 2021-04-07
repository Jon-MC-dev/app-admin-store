import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/models/marca_model.dart';
import 'package:app4/src/models/producto_model.dart';
import 'package:app4/src/providers/categoria_providers.dart';
import 'package:app4/src/providers/marcas_providers.dart';
import 'package:app4/src/providers/producto_providers.dart';
import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/widgets/tabla_detalles.dart';
import 'package:app4/src/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ProductoController extends AbstractController {
  @override
  ProviderAbs modelProvider = new ProductoProvider();
  @override
  RecursosDatos modelDataSource = new ProductoDataSource();
  @override
  ModelAbs objModel = new Producto();

  RxList<Marca> listaMarcas = <Marca>[].obs;
  RxList<Categoria> listaCategorias = <Categoria>[].obs;

  RxString valorCategoria = 'Categoria 1'.obs;
  RxString valorMarca = 'Marca 1'.obs;

  RxList<Detalle> listaDetalles = <Detalle>[].obs;
  DetalleDataSource detalleDataSource = DetalleDataSource();

  @override
  Future<bool> addData() async {
    return false;
  }

  @override
  deteleData() async {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list =
        await modelProvider.getData(model: Producto()..id = id);
    await Future.delayed(Duration(seconds: 10));
    return list.cast<Producto>();
  }

  @override
  Future<bool> saveChanges() async {
    return false;
  }

  @override
  void cleanForm() {}

  void onChangeSelectCategoria(dynamic value) {
    print(value);
  }

  void onChangeSelectMarca(dynamic value) {
    print(value);
  }

  TextEditingController caracteristica = new TextEditingController();
  TextEditingController descripcion = new TextEditingController();
  void openDetalle({bool modoEdicion = false, int index}) {
    if (modoEdicion) {
      caracteristica.text = listaDetalles[index].caracteristica;
      descripcion.text = listaDetalles[index].descripcion;
    }
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                CampoTexto(
                  label: 'Caracteristica',
                  controllerText: caracteristica,
                ),
                CampoTexto(
                  label: 'Descripcion',
                  controllerText: descripcion,
                  maxLength: 50,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Canselar'),
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
                this.addDetalle(edicion: modoEdicion, index: index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addDetalle({bool edicion, int index}) {
    if (!edicion) {
      if (descripcion.text != '' && caracteristica.text != '') {
        listaDetalles.add(Detalle(caracteristica.text, descripcion.text));
      }
    } else {
      listaDetalles[index] = Detalle(caracteristica.text, descripcion.text);
    }
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    print(barcodeScanRes);
    controllersInputs['codigoBarras'].text = barcodeScanRes;
  }

  @override
  void onInit() {
    MarcasProvider().getData(model: Marca()..id = 0).then((value) {
      this.listaMarcas.assignAll(value.cast<Marca>());
    });
    CategoriaProvider().getData(model: Categoria()..id = 0).then((value) {
      this.listaCategorias.assignAll(value.cast<Categoria>());
    });
    this.controllersInputs['codigoBarras'] = new TextEditingController();

    super.onInit();
  }
}
