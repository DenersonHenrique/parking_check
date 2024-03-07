import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parking_check/shared/widgets/bottom_navibar_widget.dart';

void main() {
  testWidgets('BottomNavibarWidget test', (WidgetTester tester) async {
    int currentIndex = 0;

    // Build the BottomNavibarWidget
    await tester.pumpWidget(
      MaterialApp(
        home: BottomNavibarWidget(
          currentIndex: currentIndex,
          onTabTapped: (index) {
            currentIndex = index;
          },
        ),
      ),
    );

    // Verify that the BottomNavigationBar displays correctly
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify that the current index matches the initial value
    expect(currentIndex, 0);

    // Tap on the second item
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that the current index updates after tapping
    expect(currentIndex, 1);
  });
}
