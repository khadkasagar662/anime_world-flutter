import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserProvider extends UserProvider {
  Future<void> addProductToCart(String productId) async {
    // Simulate the API call.
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> rateProduct(String productId, double rating) async {
    // Simulate the API call.
    await Future.delayed(const Duration(seconds: 1));
  }
}