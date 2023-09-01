import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:test/test.dart';

void main() {
  test('cart property should be a list of dynamic', () {
    final user = User(
      id: '1234567890',
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password123',
      address: '',
      type: '',
      token: 'a0bej32ibe5038dkdkdu33093838',
      cart: [1, 2, 3],
    );

    expect(user.cart, isA<List<dynamic>>());
  });
}