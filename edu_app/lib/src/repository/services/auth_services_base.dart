import 'package:edu_app/src/repository/models/auth_models/sign_in_model.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_up_model.dart';
import 'package:flutter/material.dart';

abstract class AuthServicesBase {
  Future<void> signIn(BuildContext context, {required SignInModel model});

  Future<void> signUp(BuildContext context, {required SignUpModel model});

  bool checkPassword(String text);

  bool checkEmail(String text);

  Future<String> enterToApp();

  Future<void> exit(BuildContext context);
}
