import 'package:assignmentfinal/constants/global_variable.dart';
import 'package:assignmentfinal/features/auth/model/user.dart';
import 'package:assignmentfinal/features/auth/ViewModel/auth_sevice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

// Generate a mock class for HttpClient using mockito code generation.
class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockHttpClient mockHttpClient;

    setUp(() {
      // Set up the AuthService with the mock HTTP client.
      mockHttpClient = MockHttpClient();
      // authService = AuthService(httpClient: mockHttpClient);
    });

    test('signUpUser should call the API and update user data on success',
        () async {
      // Arrange
      final user = User(
        id: '',
        name: 'Test User',
        email: 'test@example.com',
        password: 'test123',
        token: '',
        address: '',
        type: '',
        cart: [],
      );

      final response =
          http.Response('{"id": "some_user_id", "token": "some_token"}', 200);
      final Uri expectedUri = Uri.parse('$uri/api/signup');
      when(mockHttpClient.post(expectedUri,
              headers: anyNamed('headers'), body: anyNamed('body')))
          .thenAnswer((_) async => response);

      // Act
      // authService.signUpUser(
      //   context: null, // You can provide the appropriate context for testing.
      //   email: user.email,
      //   password: user.password,
      //   name: user.name,
      // );

     
      verify(mockHttpClient.post(
        Uri.parse('$uri/api/signup'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: anyNamed('body'),
      ));

      expect(user.id,
          isNotEmpty); 
      expect(user.token,
          isNotEmpty); // Expect that the user token is not empty after sign-up.
      expect(
          user.token,
          equals(
              'some_token')); // Expect that the user token matches the API response.

    });
  });
}
