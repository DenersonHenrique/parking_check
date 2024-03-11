import 'package:faker/faker.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/entities/vehicle_entity.dart';

class MockCarSpaceEntity extends CarSpaceEntity {
  const MockCarSpaceEntity({
    required super.id,
    required super.number,
    required super.isAvailable,
    required super.vehicle,
  });

  factory MockCarSpaceEntity.random() {
    final faker = Faker();
    return MockCarSpaceEntity(
      id: faker.randomGenerator.integer(999),
      number: faker.randomGenerator.integer(999).toString(),
      isAvailable: faker.randomGenerator.boolean(),
      vehicle: VehicleEntity(
        identifier: faker.randomGenerator.integer(999).toString(),
        input: faker.date
            .dateTime(
              minYear: 2000,
              maxYear: 2024,
            )
            .toString(),
        output: faker.date
            .dateTime(
              minYear: 2000,
              maxYear: 2024,
            )
            .toString(),
      ),
    );
  }
}
