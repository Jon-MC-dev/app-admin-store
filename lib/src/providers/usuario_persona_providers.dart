import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
import 'package:app4/src/models/usuario_model.dart';
import 'package:app4/src/providers/persona_providers.dart';
import 'package:app4/src/providers/usuario_providers.dart';

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
    return true;
  }

  @override
  Future<bool> deleteData(ModelAbs model) async {
    return true;
  }

  @override
  Future<List<ModelAbs>> getData({ModelAbs model}) async {
    List<Persona> personList = await persona.getData(
        model:
            Persona(id: model.id)); // primero se traeran los datos de persona
    List<Usuario> userList =
        await persona.getData(model: Usuario(id: model.id));

    List<PersonaUsuario> personsUsers = [];
    for (var i = 0; i < personList.length; i++) {
      if (personList[i].id == userList[i].id) {
        personsUsers.add(new PersonaUsuario(
            id: personList[i].id,
            persona: personList[i],
            usuario: userList[i]));
      }
    }
    return personsUsers;
  }

  @override
  Future<bool> updateData(ModelAbs model) async {
    return true;
  }
}
