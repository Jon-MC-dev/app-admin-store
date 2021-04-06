import 'package:app4/src/models/categoria_model.dart';
import 'package:app4/src/models/marca_model.dart';
import 'package:app4/src/models/producto_model.dart';
import 'package:app4/src/providers/categoria_providers.dart';
import 'package:app4/src/providers/marcas_providers.dart';
import 'package:app4/src/providers/producto_providers.dart';
import 'package:app4/src/controllers/abstracts/abstrac_controller.dart';
import 'package:app4/src/models/abstracts/abstrac_model.dart';
import 'package:app4/src/providers/abstracts/abstract_providers.dart';
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

  @override
  void onInit() {
    MarcasProvider().getData(model: Marca()..id = 0).then((value) {
      this.listaMarcas.assignAll(value.cast<Marca>());
    });
    CategoriaProvider().getData(model: Categoria()..id = 0).then((value) {
      this.listaCategorias.assignAll(value.cast<Categoria>());
    });
    super.onInit();
  }
}
