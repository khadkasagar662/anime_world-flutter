import 'package:assignmentfinal/common/custom_button.dart';
import 'package:assignmentfinal/features/account/model/order.dart';
import 'package:assignmentfinal/features/admin/Viewmodel/admin_services.dart';
import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:assignmentfinal/features/order/screen/order_details.dart';
import 'package:assignmentfinal/features/product_details/model/product.dart';
import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';


class MockUserProvider extends Mock implements UserProvider {}

void main() {
  testWidgets('OrderDetailScreen widget test', (WidgetTester tester) async {
    final mockUserProvider = MockUserProvider();
    when(mockUserProvider.user).thenReturn(User(type: 'user', address: 'ktm', cart: [], email: 'vbidjk@gmail.com', id: '2344', password: '12345', name: 'hari', token: 'dfsdjkewhrweior')); // Adjust this based on your scenario
    
    final order = Order(
      id: '123',
      orderedAt: DateTime.now().millisecondsSinceEpoch,
      totalPrice: 150.0,
      products: [Product(name: 'Product 1', images: ['image_url'], category: '', description: '', price: 50, quantity: 2)],
      quantity: [1],
      status: 0, address: 'ktm', userId: '2343434',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: mockUserProvider,
          child: OrderDetailScreen(order: order),
        ),
      ),
    );

    expect(find.text('Order Date:'), findsOneWidget);
    expect(find.text('Order ID:'), findsOneWidget);
    expect(find.text('Order Total:'), findsOneWidget);
    expect(find.text('Purchase Details'), findsOneWidget);
    expect(find.text('Tracking'), findsOneWidget);

    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    expect(find.text('Completed'), findsOneWidget);

  });
}

class MockBuildContext extends Mock implements BuildContext {}

// class MockUserProvider extends Mock implements UserProvider {}

class MockAdminServices extends Mock implements AdminServices {}

class MockProduct extends Mock implements Product {}

class MockOrder extends Mock implements Order {}
