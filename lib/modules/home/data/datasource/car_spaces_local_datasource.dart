import '../../../../commons/adapters/storage/storage_client.dart';
import '../models/car_space_model.dart';

abstract class ICarSpacesLocalDatasource {
  Future<List<CarSpaceModel>?> get();
}

class CarSpacesLocalDatasource extends ICarSpacesLocalDatasource {
  final IStorageClient<String> storageClient;

  CarSpacesLocalDatasource(this.storageClient);

  @override
  Future<List<CarSpaceModel>?> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}
