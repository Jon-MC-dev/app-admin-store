import 'package:app4/src/models/abstracts/abstrac_model.dart';

abstract class ProviderAbs {
  String host;

  Future<List<ModelAbs>> getData({ModelAbs model});

  Future<bool> addData(ModelAbs model);

  Future<bool> updateData(ModelAbs model);

  Future<bool> deleteData(ModelAbs model);
}
