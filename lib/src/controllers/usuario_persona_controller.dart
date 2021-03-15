import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/models/persona_usuario_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
import 'package:app4/src/providers/usuario_persona_providers.dart';

class UsuarioPersonaController extends AbstractController {
  @override
  ProviderAbs modelProvider = PersonaUsuarioProvider();
  @override
  RecursosDatos modelDataSource = PersonaUsuarioDataSource();
  @override
  ModelAbs objModel = new PersonaUsuario();
  @override
  Future<bool> addData() async {
    return false;
  }

  @override
  deteleData() {}

  @override
  Future<List<ModelAbs>> getData({id = 0}) async {
    List<ModelAbs> list =
        await modelProvider.getData(model: PersonaUsuario()..id = id);
    return list.cast<PersonaUsuario>();
  }

  @override
  Future<bool> saveChanges() async {
    return true;
  }
}
