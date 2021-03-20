import 'package:app4/src/models/abstracts/abstrac_model.dart';

abstract class ProviderAbs {
  String host;
  String tbl;
  String campo;

  Future<List<ModelAbs>> getData({ModelAbs model});

  Future<bool> addData(ModelAbs model);

  Future<bool> updateData(ModelAbs model);

  Future<bool> deleteData(ModelAbs model);

  Future<int> getMaxID();
}
