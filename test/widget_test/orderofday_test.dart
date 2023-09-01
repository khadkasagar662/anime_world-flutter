import 'package:assignmentfinal/common/loading.dart';
import 'package:assignmentfinal/features/home/ViewModel/home_services.dart';
import 'package:assignmentfinal/features/product_details/model/product.dart';
import 'package:assignmentfinal/features/product_details/View/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  testWidgets('DealOfDay widget test', (WidgetTester tester) async {
    final mockDealOfDayProduct = Product(
      name: 'Test Product',
      images: ['test_image_url'], category: '', description: '', price:50, quantity: 2,
    );
    final mockHomeServices = MockHomeServices();
    when(mockHomeServices.fetchDealOfDay(context: anyNamed('context')))
        .thenAnswer((_) async => mockDealOfDayProduct);

    // await tester.pumpWidget(
    //   MaterialApp(
    //     home: DealOfDay(
    //       homeServices: mockHomeServices,
    //     ),
    //   ),
    // );

    expect(find.byType(Loader), findsOneWidget);

    await tester.pump();

    expect(find.byType(Loader), findsNothing);

    expect(find.text('Deal of the day'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(ProductDetailScreen), findsOneWidget);

    expect(find.text('Test Product'), findsOneWidget);

  });
}

class MockHomeServices extends Mock implements HomeServices {}

class MockProduct extends Mock implements Product {}

class MockBuildContext extends Mock implements BuildContext {}
