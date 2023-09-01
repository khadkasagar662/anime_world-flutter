
import 'package:assignmentfinal/features/product_details/model/product.dart';
import 'package:assignmentfinal/features/product_details/Viewmodel/product_details_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


// import '../../mocks/mock_user_provider.dart';

void main() {
  final productDetailServices = ProductDetailServices(
  );

  test('addToCart should call the API on success', () async {
    // Arrange
    final product = Product(
      id: '',
      name: 'Test Product',
      quantity: 10.0,
      images: ['image1.jpg', 'image2.jpg'],
      category: 'Category',
      price: 100.0, description: '',
    );

    
    // ignore: unused_local_variable
    final response = http.Response('', 200);

    productDetailServices.addToCart(
      context: null, 
      product: product,
    );

   
  });

  test('rateProduct should call the API on success', () async {
    final product = Product(
      id: '',
      name: 'Test Product',
      quantity: 10.0,
      images: ['image1.jpg', 'image2.jpg'],
      category: 'Category',
      price: 100.0, description: '',
    );


    // ignore: unused_local_variable
    final response = http.Response('', 200);

    // Act
    productDetailServices.rateProduct(
      context: null, 
      product: product,
      rating: 5.0,
    );

 
  });
}