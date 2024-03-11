import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/entities/vehicle_entity.dart';
import 'package:parking_check/modules/home/presentation/views/car_spaces/widgets/car_info_widget.dart';
import 'package:parking_check/modules/home/presentation/views/car_spaces/widgets/car_space_item_widget.dart';

void main() {
  testWidgets(
      'CarSpaceItemWidget should be displayed correct content when available.',
      (WidgetTester tester) async {
    const spaceItem = CarSpaceEntity(
      id: 1,
      number: 'A1',
      isAvailable: true,
      vehicle: null,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CarSpaceItemWidget(space: spaceItem),
        ),
      ),
    );

    final spaceNumberFinder = find.text('Vaga ${spaceItem.number}');
    final carInfoWidgetFinder = find.byType(CarInfoWidget);

    expect(spaceNumberFinder, findsOneWidget);
    expect(carInfoWidgetFinder, findsNothing);
  });

  testWidgets('CarSpaceItemWidget displays correct content when not available.',
      (WidgetTester tester) async {
    final spaceItem = CarSpaceEntity(
      id: 1,
      number: 'A1',
      isAvailable: false,
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CarSpaceItemWidget(space: spaceItem),
        ),
      ),
    );

    final spaceNumberFinder = find.text('Vaga ${spaceItem.number}');
    final carInfoWidgetFinder = find.byType(CarInfoWidget);

    expect(spaceNumberFinder, findsOneWidget);
    expect(carInfoWidgetFinder, findsOneWidget);
  });
}
