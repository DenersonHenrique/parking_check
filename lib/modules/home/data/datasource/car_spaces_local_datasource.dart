import 'dart:convert';

import '../../../../commons/adapters/storage/storage_client.dart';
import '../../../../commons/helpers/errors/local_errors.dart';
import '../models/car_space_model.dart';

abstract class ICarSpacesLocalDatasource {
  Future<List<CarSpaceModel>?> get();
}

class CarSpacesDatasource extends ICarSpacesLocalDatasource {
  final IStorageClient<String> _storageClient;

  static const String _key = 'spaces';

  CarSpacesDatasource(this._storageClient);

  @override
  Future<List<CarSpaceModel>?> get() async {
    try {
      final response = await _storageClient.read(_key);

      return (jsonDecode(response.data['spaces'] ?? <CarSpaceModel>[]) as List)
          .map((e) => CarSpaceModel.fromMap(e))
          .toList();
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }
}
