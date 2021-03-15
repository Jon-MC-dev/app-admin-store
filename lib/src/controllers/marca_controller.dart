import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:app4/src/providers/marcas_providers.dart';
import 'package:app4/src/models/marca_model.dart';

class MarcaController extends GetxController {
  TextEditingController marcaController;
  MarcasProvider marcaProvider;
  final formKey = GlobalKey<FormState>();
  Marca marca = new Marca();
  Function accion;
  MarcaDataSource marcaDataSource;
  BuildContext context;

  validarOnSubmit() async {
    if (formKey.currentState.validate()) {
      if (await accion()) {
        getMarcas().then((value) {
          marcaDataSource.lista = value;
          Fluttertoast.showToast(
              msg: "Se realizo la operacion con exito",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
          print("marcaDataSource.updateDataGridSource(); ");
          marcaDataSource.updateDataGridSource();
          Navigator.pop(context);
          return true;
        });
      } else {
        Fluttertoast.showToast(
            msg: "Ocurrio un error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return false;
  }

  String validarInput(String valor) {
    print("Validar input");
    print(valor);
    if (valor.isEmpty) {
      return "No puede quedar vacio";
    } else if (valor.length <= 3) {
      return "El nombre es muy corto";
    } else {
      return null;
    }
  }

  Future<List<Marca>> getMarcas() async {
    List<ModelAbs> list = await marcaProvider.getData(model: Marca()..id = 0);
    return list.cast<Marca>();
  }

  Future<bool> agregarMarca() async {
    print("Marca para GUARDAR ${marcaController.text}");
    marca.nombre = marcaController.text;
    return await marcaProvider.addData(marca);
  }

  Future<bool> guardarEdicion() async {
    print("Marca para EDITAR ${marcaController.text} ID: ${marca.id}");
    marca.nombre = marcaController.text;
    return await marcaProvider.updateData(marca);
  }

  eliminarMarca() async {
    print("Hola we vamos a eliminar o que?");
    await marcaProvider.deleteData(marca);
    marcaDataSource.lista = await getMarcas();
    Fluttertoast.showToast(
        msg: "Se realizo la operacion con exito",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
    print("marcaDataSource.updateDataGridSource(); ");
    marcaDataSource.updateDataGridSource();
    //Navigator.pop(context);
  }

  @override
  void onInit() {
    marcaProvider = MarcasProvider();
    marcaController = TextEditingController();

    super.onInit();
  }
}
