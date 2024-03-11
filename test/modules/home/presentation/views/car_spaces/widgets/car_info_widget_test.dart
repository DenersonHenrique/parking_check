import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_check/modules/home/presentation/views/car_spaces/widgets/car_info_widget.dart';

void main() {
  testWidgets('CarInfoWidget displays correct info',
      (WidgetTester tester) async {
    // Build the CarInfoWidget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CarInfoWidget(
            info: 'Car info',
          ),
        ),
      ),
    );

    final textFinder = find.text('CAR INFO');

    expect(textFinder, findsOneWidget);

    final textStyle = tester.widget<Text>(textFinder).style!;
    expect(textStyle.fontFamily, 'Google');
    expect(textStyle.fontSize, 16);
    expect(textStyle.fontWeight, FontWeight.bold);
    expect(textStyle.color, Colors.white);
  });
}
