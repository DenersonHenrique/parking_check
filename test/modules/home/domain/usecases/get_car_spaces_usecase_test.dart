import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/repository/car_spaces_respository.dart';
import 'package:parking_check/modules/home/domain/usecases/get_car_spaces_usecase.dart';

import '../../../../mocks/car_space_entity_mock.dart';

class MockCarSpacesRepository extends Mock implements ICarSpacesRepository {}

void main() {
  late IGetCarSpacesUsecase usecase;
  late ICarSpacesRepository repository;

  final List<CarSpaceEntity> carSpaceList = List.generate(
    10,
    (_) => MockCarSpaceEntity.random(),
  );

  setUp(() {
    repository = MockCarSpacesRepository();
    usecase = GetCarSpacesUsecase(repository);
  });

  group('GetCarSpacesUsecase', () {
    test('Should be return a list of car space entities.', () async {
      // Arrange
      when(() => repository.getCarSpaces())
          .thenAnswer((_) async => carSpaceList);

      // Act
      final result = await usecase.call();

      // Assert
      expect(result, carSpaceList);
      verify(() => repository.getCarSpaces()).called(1);
    });

    test('Should be throw an exception if repository call fails.', () async {
      // Arrange
      when(() => repository.getCarSpaces()).thenThrow(Exception());

      // Act & Assert
      expect(() => usecase.call(), throwsException);
      verify(() => repository.getCarSpaces()).called(1);
    });
  });
}
