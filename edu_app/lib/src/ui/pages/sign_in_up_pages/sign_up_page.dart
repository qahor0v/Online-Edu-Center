import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/ui/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  static const String id = "sign_up_page";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final widthSize = MediaQuery.of(context).size.width;
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final nameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final emailController = useTextEditingController();
    var visibleText = useState<bool>(false);
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 25,
              right: 25,
            ),
            child: ListView(
              children: [
                SizedBox(
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
                const Text(
                  "signUpController.nameChecker.value",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                    controller: nameController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
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
                const Text(
                  "signUpController.lastNameChecker.value",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                    controller: lastNameController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Enter your last name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
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
                const Text(
                  "signUpController.userNameChecker.value",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                    controller: usernameController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Enter your username",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
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

                const Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                    controller: emailController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
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
                Text(
                  "signUpController.passwordChecker.value",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          visibleText.value = !visibleText.value;
                        },
                        icon: visibleText.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
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
                const Text(
                  "signUpController.passwordRepeatChecker.value",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
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
                          controller: confirmPasswordController,
                          obscureText: visibleText.value,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: "Enter your password again",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          visibleText.value = !visibleText.value;
                        },
                        icon: visibleText.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
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
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: const Text("YOKI"),
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
                    padding: const EdgeInsets.all(5),
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
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
                        Go(context).id(SignInPage.id);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
