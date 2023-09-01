import 'package:assignmentfinal/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('AccountButton widget test', (WidgetTester tester) async {
    bool buttonTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: AccountButton(
          text: 'Test Button',
          onTap: () {
            buttonTapped = true;
          },
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);

    await tester.tap(find.byType(AccountButton));
    await tester.pump();

    expect(buttonTapped, isTrue);

  });
}
