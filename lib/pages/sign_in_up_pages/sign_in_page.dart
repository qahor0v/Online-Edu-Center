import 'package:education/getx_controllers/switch_visibility.dart';
import 'package:education/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:education/service/do_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../getx_controllers/auth_checker.dart';

class SignInPage extends StatelessWidget {
  static const String id = "sign_in_page";

  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final authCheckController = Get.put(AuthCheckController());

  void _signIn() async {
    String userName = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    DoSignIn doSignIn = DoSignIn(userName: userName, password: password);
    doSignIn.signIn();
  }

  @override
  Widget build(BuildContext context) {
    VisibleController controller = Get.put(VisibleController());

    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
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
                      image: AssetImage("assets/images/signin.png"),
                      fit: BoxFit.fitHeight,
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
                  authCheckController.userNameChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          authCheckController.userNameChecker.value,
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
                      controller: _usernameController,
                      style: TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter username",
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
                  authCheckController.passwordChecker.value.isEmpty
                      ? SizedBox.shrink()
                      : Text(
                          authCheckController.passwordChecker.value,
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
                              hintText: "Enter the password",
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
                    height: 40,
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
                        _signIn();
                      },
                      child: const Text(
                        "Sign in",
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
                            child: Text("Google bilan kirish"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Accountingiz yo'qmi?"),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpPage.id);
                        },
                        child: const Text(
                          "Ro'yhatdan o'ting",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            authCheckController.check.value
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
