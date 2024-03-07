import '../../domain/entities/car_space_entity.dart';
import '../../domain/repository/car_spaces_respository.dart';
import '../datasource/car_spaces_local_datasource.dart';

class CarSpacesRepository implements ICarSpacesRepository {
  final ICarSpacesLocalDatasource _carSpacesLocalDatasource;

  CarSpacesRepository(this._carSpacesLocalDatasource);

  @override
  Future<List<CarSpaceEntity>?> getCarSpaces() async {
    final response = await _carSpacesLocalDatasource.get();
    return response;
  }
}
