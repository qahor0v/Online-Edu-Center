import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edu_app/src/repository/constants/endpoints.dart';
import 'package:edu_app/src/repository/constants/symbols.dart';
import 'package:edu_app/src/repository/exceptions/logger.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_in_model.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_up_model.dart';
import 'package:edu_app/src/repository/services/auth_services_base.dart';

class AuthServices implements AuthServicesBase {
  static final dio = Dio(
    BaseOptions(baseUrl: Endpoints.base),
  );

  @override
  bool checkEmail(String text) {
    return text.contains("@");
  }

  @override
  bool checkPassword(String text) {
    bool haveNumber = false;
    bool haveUpperSymbol = false;
    bool haveOthers = false;

    for (String item in CheckerSymbols.uppercaseLetters) {
      if (text.contains(item)) {
        haveUpperSymbol = true;
        break;
      }
    }

    for (var item in CheckerSymbols.numbers) {
      if (text.contains(item)) {
        haveNumber = true;
        break;
      }
    }

    for (var item in CheckerSymbols.symbolList) {
      if (text.contains(item)) {
        haveOthers = true;
        break;
      }
    }

    return haveOthers && haveNumber && haveUpperSymbol;
  }

  @override
  Future<void> signIn({required SignInModel model}) async {
    if ((model.password.isEmpty || model.password.length < 6) &&
        model.username.isEmpty) {
      printer("if number 1");
      model.passwordValue.value = "Iltimos, parolni to'g'ri kiriting kiriting";
      model.usernameValue.value = "Iltimos, usename-ni kiriting";
    } else if (model.password.isEmpty || model.password.length < 6) {
      model.passwordValue.value = "Iltimos, parolni to'g'ri kiriting kiriting";
    } else if (model.username.isEmpty) {
      model.usernameValue.value = "Iltimos, usename-ni kiriting";
    }

    if (!(model.password.isEmpty || model.password.length < 6) &&
        model.username.isNotEmpty) {
      model.passwordValue.value = "";
      model.usernameValue.value = "";
      try {
        printer("starting...");
        final response = await dio.post(Endpoints.signIn, data: {
          "password": model.password,
          "username": model.username,
        });

        log("${response.data}");
      } catch (e) {
        log("$e");
      }
    }
  }

  @override
  Future<void> signUp({required SignUpModel model}) async {}
}
