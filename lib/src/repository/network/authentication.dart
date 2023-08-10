import 'package:dio/dio.dart';
import '../exceptions/forbidden_exception.dart';
import '../exceptions/unauthorized_exception.dart';
import 'apis.dart';

class Authenticate {
  static final Dio dio = Dio();
  static int? result;

  static Future signIn(String username, String password, Map map) async {
    try {
      final response = await dio.post(API.BASE + API.signInUrl, data: map);
      print("THIS IS THE RESPONSE: $response");
      print(response.statusCode);

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        return response;
      } else if (statusCode == 401) {
        throw UnauthorizedException('Unauthorized: Invalid credentials');
      } else if (statusCode == 403) {
        throw ForbiddenException('Forbidden: Access denied');
      }
    } on DioException catch (e) {
      print("MANA: $e");
      print("MANA: ${e.response}");
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
    }
  }

  static Future signUp(String name, String lastName, String username,
      String email, String password, Map map) async {
    try {
      final response = await dio.post(API.BASE + API.signUpUrl, data: map);
      print(response);
      print(response.statusCode);
      return response.statusCode;
    } catch (error) {
      print('Sign-up error: $error');
    }
  }
}
