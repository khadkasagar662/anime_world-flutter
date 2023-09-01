import 'package:assignmentfinal/common/bottom_bar.dart';
import 'package:assignmentfinal/features/account/view/account_screen.dart';
import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:assignmentfinal/features/cart/View/cart_screen.dart';
import 'package:assignmentfinal/features/home/View/home_screen.dart';
import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';


class MockUserProvider extends Mock implements UserProvider {}

void main() {
  testWidgets('BottomBar widget test', (WidgetTester tester) async {
    final mockUserProvider = MockUserProvider();

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: mockUserProvider,
          child: const BottomBar(),
        ),
      ),
    );

    expect(find.byType(HomeScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.person_outline_outlined));
    await tester.pump();

    expect(find.byType(AccountScreen), findsOneWidget);

    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pump();

    expect(find.byType(CartScreen), findsOneWidget);

  });
}

// mixin MockUserProvider implements Mock, UserProvider {}

class MockBuildContext extends Mock implements BuildContext {}

class MockUser extends Mock implements User {}

mixin MockHomeScreen implements Mock, HomeScreen {}

mixin MockAccountScreen implements Mock, AccountScreen {}

mixin MockCartScreen implements Mock, CartScreen {}
