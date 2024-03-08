import '../entities/car_space_entity.dart';

abstract class ICarSpacesRepository {
  Future<List<CarSpaceEntity>?> getCarSpaces();
  Future<void> saveCarSpaces(String key, List<CarSpaceEntity>? value);
}
