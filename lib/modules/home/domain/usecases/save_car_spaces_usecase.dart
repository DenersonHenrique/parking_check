import '../entities/car_space_entity.dart';
import '../repository/car_spaces_respository.dart';

abstract class ISaveCarSpacesUsecase {
  Future<void> call(String key, List<CarSpaceEntity>? spaces);
}

class SaveCarSpacesUsecase implements ISaveCarSpacesUsecase {
  final ICarSpacesRepository _repository;

  SaveCarSpacesUsecase(this._repository);

  @override
  Future<void> call(String key, List<CarSpaceEntity>? spaces) async =>
      await _repository.saveCarSpaces(key, spaces);
}
