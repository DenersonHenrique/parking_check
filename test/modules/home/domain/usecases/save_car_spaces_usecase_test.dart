import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/repository/car_spaces_respository.dart';
import 'package:parking_check/modules/home/domain/usecases/save_car_spaces_usecase.dart';

class MockCarSpacesRepository extends Mock implements ICarSpacesRepository {}

void main() {
  late ICarSpacesRepository repository;
  late ISaveCarSpacesUsecase usecase;

  setUp(() {
    repository = MockCarSpacesRepository();
    usecase = SaveCarSpacesUsecase(repository);
  });

  group('SaveCarSpacesUsecase', () {
    test('calls repository with correct parameters', () async {
      // Arrange
      const key = 'spaces_key';
      const spaces = [
        CarSpaceEntity(id: 1, number: 'A1', isAvailable: true),
        CarSpaceEntity(id: 2, number: 'A2', isAvailable: false),
      ];

      // Act
      await usecase.call(key, spaces);

      // Assert
      verify(() => repository.saveCarSpaces(key, spaces)).called(1);
    });

    test('calls repository with null spaces parameter', () async {
      // Arrange
      const key = 'spaces_key';

      // Act
      await usecase.call(key, null);

      // Assert
      verify(() => repository.saveCarSpaces(key, null)).called(1);
    });
  });
}
