class SignUpModel {
  String name;
  String lastName;
  String userName;
  String email;
  String password;
  String confirmPassword;

  SignUpModel({
    required this.name,
    required this.confirmPassword,
    required this.email,
    required this.lastName,
    required this.password,
    required this.userName,
  });
}
