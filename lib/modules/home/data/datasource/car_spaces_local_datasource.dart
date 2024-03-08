import '../models/car_space_model.dart';

abstract class ICarSpacesLocalDatasource {
  Future<List<CarSpaceModel>?> get();
}

class CarSpacesLocalDatasource extends ICarSpacesLocalDatasource {
  @override
  Future<List<CarSpaceModel>?> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}
