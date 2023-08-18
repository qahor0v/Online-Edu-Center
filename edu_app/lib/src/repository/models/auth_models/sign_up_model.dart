import 'package:flutter/material.dart';

class SignUpModel {
  String name;
  String lastName;
  String userName;
  String email;
  String password;
  String confirmPassword;
  ValueNotifier<String> nameValue;
  ValueNotifier<String> lastNameValue;
  ValueNotifier<String> usernameValue;
  ValueNotifier<String> emailValue;
  ValueNotifier<String> passwordValue;
  void Function() updateState;

  SignUpModel({
    required this.name,
    required this.confirmPassword,
    required this.email,
    required this.lastName,
    required this.password,
    required this.userName,
    required this.updateState,
    required this.usernameValue,
    required this.passwordValue,
    required this.emailValue,
    required this.lastNameValue,
    required this.nameValue,
  });
}
