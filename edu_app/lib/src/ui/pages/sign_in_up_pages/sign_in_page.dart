import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/ui/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "authCheckController.userNameChecker.value",
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
                  child: const TextField(
                    controller: null,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Enter username",
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
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "r.valueauthCheckController.passwordChecke",
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
                      const Expanded(
                        child: TextField(
                          controller: null,
                          obscureText: true,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: "Enter the password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: "".isEmpty
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
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
                        Colors.lightBlueAccent,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign in",
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
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Accountingiz yo'qmi?"),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Go(context).id(SignUpPage.id);
                      },
                      child: const Text(
                        "Ro'yhatdan o'ting",
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
