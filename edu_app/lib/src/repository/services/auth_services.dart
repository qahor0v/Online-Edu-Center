// ignore_for_file: use_build_context_synchronously
import 'package:edu_app/src/config/packages/exports.dart';

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
    } else if (model.email.isEmpty) {
      model.emailValue.value = AppStrings.enterEmail;
    } else {
      model.emailValue.value = "";
    }

    if (model.password != model.confirmPassword) {
      model.passwordValue.value = AppStrings.checkConfirmPassword;
    } else if (model.password.length < 6 || !checkPassword(model.password)) {
      model.passwordValue.value = AppStrings.enterTruePasswordSignUp;
    } else {
      model.passwordValue.value = "";
    }

    if (model.lastName.isEmpty) {
      model.lastNameValue.value = AppStrings.enterLastName;
    } else {
      model.lastNameValue.value = "";
    }

    if (model.name.isEmpty) {
      model.nameValue.value = AppStrings.enterName;
    } else {
      model.nameValue.value = "";
    }

    if (model.userName.isEmpty) {
      model.usernameValue.value = AppStrings.enterUsername;
    } else {
      model.usernameValue.value = "";
    }

    model.updateState;
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
          Endpoints.signUp,
          data: {
            Endpoints.password: model.password,
            Endpoints.username: model.userName,
            Endpoints.name: model.name,
            Endpoints.lastName: model.lastName,
            Endpoints.email: model.email,
          },
        );

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202) {
          showCustomDialogSuccess(
            context: context,
            message: "${model.email}${AppStrings.confirmEmail}",
            onTap: () {
              Go(context).id(SignInPage.id);
            },
          );
          printer(response.data);
        }
      } catch (e) {
        printer(e);
        e as DioException;
        if (e.response!.statusCode == 403) {
          model.updateState;
          Go(context).close();
          model.usernameValue.value = AppStrings.usernameAlreadyHave;
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
