import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/repository/car_spaces_respository.dart';
import 'package:parking_check/modules/home/domain/usecases/save_car_spaces_usecase.dart';

import '../../../../mocks/car_space_entity_mock.dart';

class MockCarSpacesRepository extends Mock implements ICarSpacesRepository {}

void main() {
  late ISaveCarSpacesUsecase usecase;
  late ICarSpacesRepository repository;

  const key = 'spaces_key';
  final List<CarSpaceEntity> carSpaceList = List.generate(
    10,
    (_) => MockCarSpaceEntity.random(),
  );

  setUp(() {
    repository = MockCarSpacesRepository();
    usecase = SaveCarSpacesUsecase(repository);
  });

  group('SaveCarSpacesUsecase', () {
    test('Should be calls repository with correct parameters.', () async {
      await usecase.call(key, carSpaceList);

      verify(() => repository.saveCarSpaces(key, carSpaceList)).called(1);
    });

    test('Should be calls repository with null spaces parameter.', () async {
      const key = 'spaces_key';

      await usecase.call(key, null);

      verify(() => repository.saveCarSpaces(key, null)).called(1);
    });
  });
}
