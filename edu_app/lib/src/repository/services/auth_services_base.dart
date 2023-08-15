import 'package:edu_app/src/repository/models/auth_models/sign_in_model.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_up_model.dart';

abstract class AuthServicesBase {
  Future<void> signIn({required SignInModel model});

  Future<void> signUp({required SignUpModel model});

  bool checkPassword(String text);

  bool checkEmail(String text);
}
