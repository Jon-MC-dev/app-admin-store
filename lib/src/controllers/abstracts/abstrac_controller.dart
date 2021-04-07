import 'dart:math';
import 'package:ansicolor/ansicolor.dart';
import 'package:app4/src/class/validador.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';

AnsiPen pen = new AnsiPen()..white(bold: true);

abstract class AbstractController extends GetxController {
  Map<String, TextEditingController> controllersInputs = {};
  ProviderAbs modelProvider;
  final formKey = GlobalKey<FormState>();
  ModelAbs objModel;
  Function accion;
  RecursosDatos modelDataSource;
  BuildContext context;
  Validador v = new Validador();
  Function funcionExtraEnValidado;
  Function funcionExtraEnValidando = () {
    return true;
  };

  Future<List<ModelAbs>> getData({id});

  Future<bool> addData();

  Future<bool> saveChanges();

  deteleData();

  validarOnSubmit() async {
    bool validacionPropia = funcionExtraEnValidando();
    bool validacionForKey = formKey.currentState.validate();
    if (validacionPropia) {
      if (validacionForKey) {
        print("accion");
        print(accion);
        if (await this.accion()) {
          getData().then((value) {
            modelDataSource.lista = value;
            Fluttertoast.showToast(
                msg: "La operación se realizó con éxito",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);
            print("modelDataSource.updateDataGridSource(); ");
            modelDataSource.updateDataGridSource();
            pen
              ..black()
              ..green();
            print(pen(
                "modelDataSource.runtimeType: ${modelDataSource.runtimeType}"));
            Navigator.pop(context);
            if (funcionExtraEnValidado == null) {
              return true;
            } else {
              return funcionExtraEnValidado();
            }
          });
        } else {
          Fluttertoast.showToast(
              msg: "Ocurrió un error",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }

    return false;
  }

  messageError(String mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  messageOk(String mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Map<String, String> getAllValues() {
    Map<String, String> retorno = {};
    if (controllersInputs != null) {
      Iterable<dynamic> listaKeys = controllersInputs.keys;
      for (var item in listaKeys) {
        retorno[item] = controllersInputs[item].text.toString();
      }
    }
    return retorno;
  }

  void resetInputs({Function funcionExtra}) {
    if (controllersInputs != null) {
      Iterable<dynamic> listaKeys = controllersInputs.keys;
      for (var item in listaKeys) {
        controllersInputs[item].text = '';
      }
    }
    if (funcionExtra != null) {
      funcionExtra();
    }
  }

  void cleanForm();

  @override
  void onInit() {
    Random random = new Random();
    int randomNumber = random.nextInt(100); // from 0 upto 99 included
    print("randomNumber: [$randomNumber]");
    super.onInit();
  }
}
