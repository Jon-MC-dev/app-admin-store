class Validador {
  List<String> listaReglas = [];

  String evaluarReglas() {
    for (var mensaje in this.listaReglas) {
      if (mensaje != null) {
        return mensaje;
      }
    }
    return null;
  }

  String esVacio(String valor, String mensaje) {
    if (valor.isEmpty) {
      return mensaje;
    }
    return null;
  }

  String valorMinimo(String valor, String mensaje, int valorMinimo) {
    if (valor.length < valorMinimo) {
      return mensaje;
    }
    return null;
  }

  String soloNumeros(String valor, String mensaje) {
    try {
      int.parse(valor);
    } on FormatException {
      return mensaje;
    }
    return null;
  }

  String soloNumerosEnteros(String valor, String mensaje) {
    try {
      int.parse(valor);
    } on FormatException {
      return mensaje;
    }
    return null;
  }

  String soloNumerosConDecimal(String valor, String mensaje) {
    try {
      double.parse(valor);
    } on FormatException {
      return mensaje;
    }
    return null;
  }

  String soloLetrasSinEspacios(String valor, String mensaje) {
    RegExp regExp = new RegExp(r'^[a-zA-Z]+$');
    if (!regExp.hasMatch(valor)) {
      return mensaje;
    }
    return null;
  }

  String soloLetrasConEspacios(String valor, String mensaje) {
    RegExp regExp = new RegExp(r"[^a-z ]", caseSensitive: false);
    if (regExp.hasMatch(valor)) {
      return mensaje;
    }
    return null;
  }

  String soloLetrasNumeros(String valor, String mensaje) {
    RegExp regExp = new RegExp(r'^[a-zA-Z0-9]+$');
    if (!regExp.hasMatch(valor)) {
      return mensaje;
    }
    return null;
  }

  String soloLetrasNumerosEspacios(String valor, String mensaje) {
    RegExp regExp = new RegExp(r"[^a-z0-9 ]", caseSensitive: false);
    if (regExp.hasMatch(valor)) {
      return mensaje;
    }
    return null;
  }
}
