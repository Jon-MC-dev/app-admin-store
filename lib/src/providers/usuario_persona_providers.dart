import 'dart:convert';

import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
import 'package:app4/src/models/usuario_model.dart';
import 'package:app4/src/providers/persona_providers.dart';
import 'package:app4/src/providers/usuario_providers.dart';
import 'package:http/http.dart' as http;

import 'abstracts/abstract_providers.dart';

class PersonaUsuarioProvider extends ProviderAbs {
  PersonaProvider persona;
  UsuarioProvider usuario;
  PersonaUsuarioProvider() {
    this.persona = new PersonaProvider();
    this.usuario = new UsuarioProvider();
  }
  @override
  Future<bool> addData(ModelAbs model) async {
    PersonaUsuario personUser = model;
    if (await this.persona.addData(personUser.persona)) {
      //print("this.getMaxID() ${await this.getMaxID()}");
      personUser.usuario.id = await this.getMaxID();
      return this.usuario.addData(personUser.usuario);
    }
    return false;
  }

  @override
  Future<bool> deleteData(ModelAbs model) async {
    return true;
  }

  @override
  Future<List<ModelAbs>> getData({ModelAbs model}) async {
    List<ModelAbs> personList = await persona.getData(
        model:
            Persona(id: model.id)); // primero se traeran los datos de persona
    List<ModelAbs> userList =
        await usuario.getData(model: Usuario(id: model.id));

    List<PersonaUsuario> personsUsers = [];
    for (var i = 0; i < personList.length; i++) {
      try {
        if (personList[i].id == userList[i].id) {
          personsUsers.add(new PersonaUsuario(
              id: personList[i].id,
              persona: personList[i],
              usuario: userList[i]));
        }
      } on RangeError {}
    }
    return personsUsers;
  }

  @override
  Future<bool> updateData(ModelAbs model) async {
    return false;
  }

  @override
  Future<int> getMaxID() async {
    final resultado = await http.get(
        'http://192.168.137.1:5000/maxID?tbl=tbl_personas&campo=id_persona');
    if (resultado.statusCode == 200) {
      final resJson = json.decode(resultado.body);
      return resJson['numMax'];
    }
    return 0;
  }
}
