// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/repository/constants/endpoints.dart';
import 'package:edu_app/src/repository/constants/symbols.dart';
import 'package:edu_app/src/repository/exceptions/logger.dart';
import 'package:edu_app/src/repository/local/secure_storage_services.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_in_model.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_up_model.dart';
import 'package:edu_app/src/repository/services/auth_services_base.dart';
import 'package:edu_app/src/ui/pages/bottom_navbar_view.dart';
import 'package:edu_app/src/ui/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:edu_app/src/ui/widgets/custom_dialog.dart';
import 'package:edu_app/src/ui/widgets/loading_dialog.dart';
import 'package:flutter/cupertino.dart';

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
  Future<void> signIn(BuildContext context,
      {required SignInModel model}) async {
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
      showLoading(context);
      model.passwordValue.value = "";
      model.usernameValue.value = "";
      try {
        printer("starting...");
        final response = await dio.post(Endpoints.signIn, data: {
          "password": model.password,
          "username": model.username,
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          SecureStorage.saveToken("${response.data}").then((value) {
            Go(context).close();
            Go(context).id(BottomNavBarView.id);
          });
        } else if (response.statusCode! > 499 && response.statusCode! < 600) {
          Go(context).close();
          showCustomDialog(
            context: context,
            message:
                "Server bilan bog'lanishda xatolik yuzaga keldi. Iltimos, birozdan so'ng urinib ko'ring.",
          );
        } else if (response.statusCode! > 399 && response.statusCode! < 500) {
          Go(context).close();
          showCustomDialog(
            context: context,
            message:
                "Login yoki parol noto'g'ri kiritilgan. Iltimos, tekshirib, qaytadan kiriting!",
          );
        } else {
          Go(context).close();
          showCustomDialog(
            context: context,
            message:
                "Noma'lum xatolik yuzaga keldi. Iltimos, qaytadan urinib ko'ring. ",
          );
        }

        log("${response.data}");
      } catch (e) {
        log("$e");
      }
    }
  }

  @override
  Future<void> signUp({required SignUpModel model}) async {}

  @override
  Future<String> enterToApp() async {
    String haveAuth = "";
    await SecureStorage.getToken().then((value) async {
      if (value.isNotEmpty) {
        haveAuth = value;
      }
    });
    return haveAuth;
  }

  @override
  Future<void> exit(BuildContext context) async {
    SecureStorage.deleteToken().then((value) {
      Go(context).id(SignInPage.id);
    });
  }
}
