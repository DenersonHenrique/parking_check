import 'dart:convert';

import '../../../../commons/adapters/storage/storage_client.dart';
import '../../../../commons/helpers/errors/local_errors.dart';
import '../models/car_space_model.dart';

abstract class ICarSpacesLocalDatasource {
  Future<List<CarSpaceModel>?> get();
  Future<void> save(String key, dynamic value);
}

class CarSpacesLocalDatasource extends ICarSpacesLocalDatasource {
  final IStorageClient<String> storageClient;

  CarSpacesLocalDatasource(this.storageClient);

  @override
  Future<List<CarSpaceModel>?> get() async {
    try {
      final response = await storageClient.read('spaces');

      return (jsonDecode(response) as List)
          .map((e) => CarSpaceModel.fromMap(e))
          .toList();
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  Future<void> save(String key, dynamic value) async {
    try {
      await storageClient.clear();
      await storageClient.save(key, value);
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }
}
