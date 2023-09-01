import 'package:assignmentfinal/features/account/model/order.dart';
import 'package:assignmentfinal/features/account/viewModel/account_services.dart';
import 'package:assignmentfinal/features/account/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockBuildContext extends Mock implements BuildContext {}

class MockAccountServices extends Mock implements AccountServices {}

void main() {
  testWidgets('Orders widget test', (WidgetTester tester) async {
    final mockAccountServices = MockAccountServices();

    when(mockAccountServices.fetchMyOrders(context: any)).thenAnswer((_) async => [Order(address: 'ktm', id: '234', orderedAt: 230, products: [], quantity: [], status: 33, totalPrice: 220, userId: '')]);

    await tester.pumpWidget(
      const MaterialApp(
        home: Orders(),
      ),
    );

    expect(find.text('Your Orders'), findsOneWidget);

    expect(find.text('See all'), findsOneWidget);

    await tester.tap(find.text('See all'));
    await tester.pumpAndSettle();

    verify(mockAccountServices.fetchMyOrders(context: any)).called(1);

  });
}
