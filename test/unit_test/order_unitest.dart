import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:assignmentfinal/provider/user_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}
class MockUserProvider extends Mock implements UserProvider {}


void main() {
  group('placeOrder', () {
    final mockClient = MockClient();
    final mockUserProvider = MockUserProvider();

    const String uri = 'http://10.0.2.2:3000'; 
    final mockUri = Uri.parse('$uri/api/order');

    test('order placement failure', () async {
      when(mockUserProvider.user).thenReturn(User(token: 'iofsadhfpeoew', cart: [], address: 'ktm', email: 'anc@gmail.com', id: '334', name: 'kk', password: '34333', type: 'user'));

      when(mockClient.post(mockUri, headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => http.Response('{"status": "failure"}', 400));

      await placeOrder(
        context: null, 
        address: 'mock_address',
        totalSum: 100.0,
        uri: mockUri, 
        httpClient: mockClient,
        userProvider: mockUserProvider,
      );

      verify(mockUserProvider.user);
      verify(mockClient.post(mockUri, headers: anyNamed('headers'), body: anyNamed('body')));
    });

  });
}

placeOrder({required context, required String address, required double totalSum, required Uri uri, required MockClient httpClient, required MockUserProvider userProvider}) {
}
