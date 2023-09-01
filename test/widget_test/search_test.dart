import 'package:assignmentfinal/constants/global_variable.dart';
import 'package:assignmentfinal/features/product_details/model/product.dart';
import 'package:assignmentfinal/features/search/ViewModel/search_services.dart';
import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;


class MockUserProvider extends Mock implements UserProvider {}

void main() {
  final mockUserProvider = MockUserProvider();
  final searchServices = SearchServices();

  test('should return a list of products', () async {
    when(mockUserProvider.user.token).thenReturn('token');
    when(
      http.get(
        Uri.parse('$uri/api/products/search/searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': 'token',
        },
      ),
    ).thenAnswer((_) async => http.Response('', 200));

    List<Product> productList = await searchServices.fetchSearchedProduct(
      context: null,
      searchQuery: 'searchQuery',
    );

    expect(productList, isA<List<Product>>());
    expect(productList.length, 2);
    expect(productList[0].name, 'Anime tshirt');
    expect(productList[1].name, 'Mobile cover');
  });
}