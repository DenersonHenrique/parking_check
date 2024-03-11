import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:parking_check/modules/home/domain/entities/car_space_entity.dart';
import 'package:parking_check/modules/home/domain/entities/vehicle_entity.dart';
import 'package:parking_check/modules/home/presentation/views/car_spaces/widgets/car_space_item_widget.dart';
import 'package:parking_check/modules/home/presentation/views/car_spaces/widgets/car_spaces_grid_view_dart.dart';

class MockFunction extends Mock {
  void call(List<CarSpaceEntity> spacesList);
}

void main() {
  group('CarSpacesGridWidget', () {
    late List<CarSpaceEntity> spacesList;
    late MockFunction mockUpdateStorageSpaces;

    setUp(() {
      spacesList = [
        const CarSpaceEntity(
          id: 1,
          number: 'A1',
          isAvailable: true,
          vehicle: null,
        ),
        CarSpaceEntity(
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
        ),
      ];
      mockUpdateStorageSpaces = MockFunction();
    });

    testWidgets('Renders correct number of CarSpaceItemWidgets.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CarSpacesGridWidget(
            spacesList: spacesList,
            updateStorageSpaces: mockUpdateStorageSpaces.call,
          ),
        ),
      );

      expect(find.byType(CarSpaceItemWidget), findsNWidgets(2));
    });

    // testWidgets('Opens modal form when CarSpaceItemWidget is tapped.',
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: CarSpacesGridWidget(
    //         spacesList: spacesList,
    //         updateStorageSpaces: mockUpdateStorageSpaces.call,
    //       ),
    //     ),
    //   );

    //   await tester.tap(find.byType(CarSpaceItemWidget).first);
    //   await tester.pump();

    //   expect(find.byType(SpaceFormWidget), findsOneWidget);
    // });

    // testWidgets('Updates space and calls updateStorageSpaces when submitted.',
    //     (WidgetTester tester) async {
    //   const updatedSpace = CarSpaceEntity(
    //     id: 1,
    //     number: '1',
    //     isAvailable: false,
    //   );

    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: CarSpacesGridWidget(
    //         spacesList: spacesList,
    //         updateStorageSpaces: mockUpdateStorageSpaces.call,
    //       ),
    //     ),
    //   );

    //   await tester.tap(find.byType(CarSpaceItemWidget).first);
    //   await tester.pump();

    //   final spaceFormWidget = find.byType(SpaceFormWidget);
    //   expect(spaceFormWidget, findsOneWidget);

    //   // Simulate submitting the form with updated space
    //   await tester.tap(find.text('Submit'));
    //   await tester.pump();

    //   verify(() => mockUpdateStorageSpaces(captureAny())).captured.last;
    //   expect(
    //     (verify(() => mockUpdateStorageSpaces(captureAny())).captured.last
    //             as List<CarSpaceEntity>)
    //         .first,
    //     equals(updatedSpace),
    //   );
    // });
  });
}
