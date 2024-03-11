import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/data/datasource/car_spaces_local_datasource.dart';
import 'package:parking_check/modules/home/data/models/car_space_model.dart';
import 'package:parking_check/modules/home/data/models/vehicle_model.dart';
import 'package:parking_check/modules/home/data/repository/car_spaces_repository.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/entities/vehicle_entity.dart';

class MockCarSpacesLocalDatasource extends Mock
    implements ICarSpacesLocalDatasource {}

void main() {
  late ICarSpacesLocalDatasource localDatasource;
  late CarSpacesRepository repository;

  setUp(() {
    localDatasource = MockCarSpacesLocalDatasource();
    repository = CarSpacesRepository(localDatasource);
  });

  group('CarSpacesRepository', () {
    test('getCarSpaces returns list of CarSpaceEntity', () async {
      // Arrange
      const model1 = CarSpaceModel(
        id: 1,
        number: 'A1',
        isAvailable: true,
        vehicle: VehicleModel(identifier: 'V001', input: '', output: null),
      );
      const model2 = CarSpaceModel(
        id: 2,
        number: 'A2',
        isAvailable: false,
        vehicle: VehicleModel(identifier: 'V002', input: '', output: null),
      );
      final models = [model1, model2];
      when(() => localDatasource.get()).thenAnswer((_) async => models);

      // Act
      final result = await repository.getCarSpaces();

      // Assert
      expect(result, isNotNull);
      expect(result!.length, equals(2));
      expect(result[0].id, equals(1));
      expect(result[1].number, equals('A2'));
      verify(() => localDatasource.get()).called(1);
    });

    test('saveCarSpaces saves list of CarSpaceEntity', () async {
      // Arrange
      final entities = [
        const CarSpaceEntity(
          id: 1,
          number: 'A1',
          isAvailable: true,
          vehicle: VehicleEntity(identifier: 'V001', input: ''),
        ),
        const CarSpaceEntity(
          id: 2,
          number: 'A2',
          isAvailable: false,
          vehicle: VehicleEntity(identifier: 'V002', input: ''),
        ),
      ];
      final jsonString = jsonEncode(
        entities.map(CarSpaceModel.fromEntity).toList(),
      );
      when(() => localDatasource.save(any(), any())).thenAnswer((_) async {});

      // Act
      await repository.saveCarSpaces('key', entities);

      // Assert
      verify(() => localDatasource.save('key', jsonString)).called(1);
    });
  });
}
