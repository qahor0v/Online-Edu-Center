import 'package:education/getx_controllers/sign_up_controller.dart';
import 'package:education/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controllers/switch_visibility.dart';
import '../../service/do_sign_up.dart';

class SignUpPage extends StatelessWidget {
  static const String id = "sign_up_page";

  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  SignUpController signUpController = Get.put(SignUpController());

  Future<void> _signUp(BuildContext context) async {
    String name = _nameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String username = _userNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String passwordRepeat = _passwordRepeatController.text.trim();

    DoSignUp doSignUp = DoSignUp(
      name: name,
      lastName: lastName,
      username: username,
      email: email,
      password: password,
      passwordRepeat: passwordRepeat,
    );

    doSignUp.signUp(context);
  }

  @override
  Widget build(BuildContext context) {
    VisibleController controller = Get.put(VisibleController());
    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ro'yxatdan o'tish",
          style: TextStyle(
            color: Color(0xff213555),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 25, right: 25),
              child: ListView(
                children: [
                  Container(
                    height: widthSize * 0.4,
                    width: widthSize * 0.4,
                    child: const Image(
                      image: AssetImage("assets/images/signup.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.nameChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.nameChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter your name",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// for lastName
                  const Text(
                    "Last name",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.lastNameChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.lastNameChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter your last name",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// for username
                  const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.userNameChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.userNameChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _userNameController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter your username",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// for email
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.emailChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.emailChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// for password
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.passwordChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.passwordChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            obscureText: controller.isVisible.value,
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.changeVisibility();
                          },
                          icon: controller.isVisible.value
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// for repeating password
                  const Text(
                    "Repeat the password",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  signUpController.passwordRepeatChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          signUpController.passwordRepeatChecker.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _passwordRepeatController,
                            obscureText: controller.isVisible.value,
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: InputBorder.none,
                              hintText: "Enter your password again",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.changeVisibility();
                          },
                          icon: controller.isVisible.value
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// for sign in button
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _signUp(context);
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// for "OR" label
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey[350],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("YOKI"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[350],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  /// for social media
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: const Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                image: AssetImage("assets/images/google.png"),
                              ),
                            ],
                          ),
                          Center(
                            child: Text("Google bilan ro'yhatdan o'tish"),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Accountingiz bormi?"),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignInPage.id);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            signUpController.check.value
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
