import 'package:assignmentfinal/constants/global_variable.dart';
import 'package:assignmentfinal/features/home/widgets/catogories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TopCategories widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TopCategories(),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);

    final gestureDetectorFinder = find.byType(GestureDetector);
    expect(gestureDetectorFinder, findsNWidgets(GlobalVariables.categoryImages.length));

    await tester.tap(gestureDetectorFinder.first);
    await tester.pump();

    expect(find.byType(MaterialPageRoute), findsOneWidget);
  });
}
