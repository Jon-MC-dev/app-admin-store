import 'package:app4/src/models/abstracts/abstrac_model.dart';
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
    return [];
  }

  @override
  Future<bool> updateData(ModelAbs model) async {
    return true;
  }
}
