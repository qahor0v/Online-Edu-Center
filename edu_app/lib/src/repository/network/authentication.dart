import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:edu_app/src/repository/exceptions/custom_exception.dart';
import 'package:edu_app/src/repository/exceptions/logger.dart';
import '../exceptions/forbidden_exception.dart';
import '../exceptions/unauthorized_exception.dart';
import 'apis.dart';

class Authenticate {
  static final Dio dio = Dio();
  static int? result;

  static Future signIn(String username, String password, Map map) async {
    try {
      final response = await dio.post(API.BASE + API.signInUrl, data: map);
      printer("THIS IS THE RESPONSE: $response");
      printer(response.statusCode);

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        log("${response.data}");
        return response;
      } else if (statusCode == 401) {
        throw UnauthorizedException('Unauthorized: Invalid credentials');
      } else if (statusCode == 403) {
        throw ForbiddenException('Forbidden: Access denied');
      }
    } on DioException catch (e) {
      printer("MANA: $e");
      printer("MANA: ${e.response}");
      printer(e.response?.data);
      printer(e.response?.headers);
      printer(e.response?.requestOptions);
    }
  }

  static Future signUp(String name, String lastName, String username,
      String email, String password, Map map) async {
    try {
      final response = await dio.post(API.BASE + API.signUpUrl, data: map);
      log("$response");
      log("${response.statusCode}");
      return response.statusCode;
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          return CustomException(
            statusCode: error.response!.statusCode!,
            message: error.response!.statusMessage!,
          );
        } else {
          return CustomException(
            statusCode: 999,
            message: "There is some error. Please try again",
          );
        }
      } else {
        return CustomException(
          statusCode: 999,
          message: "There is some error. Please try again",
        );
      }
    }
  }
}
