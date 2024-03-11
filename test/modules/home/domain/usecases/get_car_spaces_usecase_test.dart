import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/repository/car_spaces_respository.dart';
import 'package:parking_check/modules/home/domain/usecases/get_car_spaces_usecase.dart';

class MockCarSpacesRepository extends Mock implements ICarSpacesRepository {}

void main() {
  late ICarSpacesRepository repository;
  late IGetCarSpacesUsecase usecase;

  setUp(() {
    repository = MockCarSpacesRepository();
    usecase = GetCarSpacesUsecase(repository);
  });

  group('GetCarSpacesUsecase', () {
    test('Should be return a list of car space entities.', () async {
      // Arrange
      final expectedSpaces = [
        const CarSpaceEntity(id: 1, number: 'A1', isAvailable: true),
        const CarSpaceEntity(id: 2, number: 'A2', isAvailable: false),
      ];
      when(() => repository.getCarSpaces())
          .thenAnswer((_) async => expectedSpaces);

      // Act
      final result = await usecase.call();

      // Assert
      expect(result, expectedSpaces);
      verify(() => repository.getCarSpaces()).called(1);
    });

    test('should throw an exception if repository call fails', () async {
      // Arrange
      when(() => repository.getCarSpaces()).thenThrow(Exception());

      // Act & Assert
      expect(() => usecase.call(), throwsException);
      verify(() => repository.getCarSpaces()).called(1);
    });
  });
}
