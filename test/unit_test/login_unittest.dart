import 'package:assignmentfinal/constants/global_variable.dart';
import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:assignmentfinal/features/auth/ViewModel/auth_sevice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      // authService = AuthService(httpClient: mockHttpClient);
    });

    test('signUpUser should call the API and update user data on success',
        () async {
      final user = User(
        id: '333', 
        name: 'Test User',
        email: 'test@example.com',
        password: 'test123',
        token: 'aer393ndfsfje',
        address: '',
        type: '',
        cart: [],
      );

      // // Act
      //  authService.signUpUser(
      //   context: null, 
      //   email: user.email,
      //   password: user.password,
      //   name: user.name,
      // );

     
      verify(mockHttpClient.post(
        Uri.parse('$uri/api/signup'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: anyNamed('body'),
      ));

   
      expect(user.id, '333'); 
      expect(user.token, 'some_token'); 
    });
  });
}
