import '../entities/car_space_entity.dart';

abstract class ICarSpacesRepository {
  Future<List<CarSpaceEntity>?> getCarSpaces();
}
