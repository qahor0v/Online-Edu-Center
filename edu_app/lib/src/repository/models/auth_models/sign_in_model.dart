import 'package:flutter/material.dart';

class SignInModel {
  String username;
  String password;
  ValueNotifier<String> usernameValue;
  ValueNotifier<String> passwordValue;

  SignInModel({
    required this.username,
    required this.password,
    required this.passwordValue,
    required this.usernameValue,
  });
}
