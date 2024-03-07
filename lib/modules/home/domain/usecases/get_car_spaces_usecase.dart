import '../entities/car_space_entity.dart';
import '../repository/car_spaces_respository.dart';

abstract class IGetCarSpacesUsecase {
  Future<List<CarSpaceEntity>> call();
}

class GetCarSpacesUsecase implements IGetCarSpacesUsecase {
  final ICarSpacesRepository _repository;

  GetCarSpacesUsecase(this._repository);

  @override
  Future<List<CarSpaceEntity>> call() async => await _repository.getCarSpaces();
}
