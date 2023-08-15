class UserModel {
  String? name;
  String? lastName;
  String? username;
  String? email;
  String? password;

  UserModel({
    required this.name,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lastName = json['lastName'],
        username = json['username'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
      };
}
