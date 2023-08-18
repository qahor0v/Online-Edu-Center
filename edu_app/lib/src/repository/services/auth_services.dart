// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/repository/constants/endpoints.dart';
import 'package:edu_app/src/repository/constants/strings.dart';
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
      model.passwordValue.value = AppStrings.enterTruePassword;
      model.usernameValue.value = AppStrings.enterUsername;
    } else if (model.password.isEmpty || model.password.length < 6) {
      model.passwordValue.value = AppStrings.enterTruePassword;
    } else if (model.username.isEmpty) {
      model.usernameValue.value = AppStrings.enterUsername;
    }

    if (!(model.password.isEmpty || model.password.length < 6) &&
        model.username.isNotEmpty) {
      showLoading(context);
      model.passwordValue.value = "";
      model.usernameValue.value = "";
      try {
        final response = await dio.post(Endpoints.signIn, data: {
          Endpoints.password: model.password,
          Endpoints.username: model.username,
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          SecureStorage.saveToken("${response.data}").then((value) {
            Go(context).close();
            Go(context).id(BottomNavBarView.id);
          });
        }
      } catch (e) {
        printer(e);
        e as DioException;
        final response = e.response;
        if (response!.statusCode! > 499 && response.statusCode! < 600) {
          Go(context).close();
          showCustomDialog(
            context: context,
            message: AppStrings.errorWithServer,
          );
        } else if (response.statusCode! > 399 && response.statusCode! < 500) {
          Go(context).close();
          showCustomDialog(
            context: context,
            message: AppStrings.checkPasswordUsername,
          );
        } else {
          Go(context).close();
          showCustomDialog(
            context: context,
            message: AppStrings.unknownError,
          );
        }
      }
    }
  }

  @override
  Future<void> signUp(BuildContext context,
      {required SignUpModel model}) async {
    if (!checkEmail(model.email)) {
      model.emailValue.value = AppStrings.enterTrueEmail;
    }
    if (model.email.length < 6 || checkEmail(model.email)) {
      model.passwordValue.value = AppStrings.enterTruePasswordSignUp;
    }

    if (model.password != model.confirmPassword) {
      model.passwordValue.value = AppStrings.checkConfirmPassword;
    }

    if (model.lastName.isEmpty) {
      model.lastNameValue.value = AppStrings.enterLastName;
    }

    if (model.name.isEmpty) {
      model.nameValue.value = AppStrings.enterName;
    }

    if (model.userName.isEmpty) {
      model.usernameValue.value = AppStrings.enterUsername;
    }

    if (model.password.isEmpty) {
      model.emailValue.value = AppStrings.enterEmail;
    }

    if (checkUp(model)) {
      showLoading(context);
      model.passwordValue.value = "";
      model.usernameValue.value = "";
      model.emailValue.value = "";
      model.lastNameValue.value = "";
      model.nameValue.value = "";
      model.updateState;

      try {
        final response = await dio.post(
          Endpoints.signIn,
          data: {
            Endpoints.password: model.password,
            Endpoints.username: model.userName,
            Endpoints.name: model.name,
            Endpoints.lastName: model.lastName,
            Endpoints.email: model.email,
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          printer(response.data);

          /// Go(context).close();
          //             Go(context).id(SignInPage.id);
        }
      } catch (e) {
        printer(e);
      }
    }
  }

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

  bool checkUp(SignUpModel model) {
    return model.userName.isNotEmpty &&
        model.name.isNotEmpty &&
        model.lastName.isNotEmpty &&
        checkPassword(model.password) &&
        model.password == model.confirmPassword &&
        checkEmail(model.email) &&
        model.password.length >= 6;
  }
}
