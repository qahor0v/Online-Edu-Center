abstract class Endpoints {
  ///API BASE URL
  static const String base = 'http://185.196.213.97:8085';

  ///API AUTH PATHS
  static const String signIn = '/api/auth/login';
  static const String signUp = '/api/auth/register';
  static const String verifyEmail = '/api/auth/verifyEmail';

  ///API Map keys
  static const String password = "password";
  static const String username = "username";
  static const String name = "name";
  static const String lastName = "lastName";
  static const String email = "email";
}
