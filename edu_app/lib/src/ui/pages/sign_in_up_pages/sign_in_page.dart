import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/repository/models/auth_models/sign_in_model.dart';
import 'package:edu_app/src/repository/services/auth_services.dart';
import 'package:edu_app/src/ui/pages/sign_in_up_pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends StatefulHookConsumerWidget {
  static const String id = "sign_in_page";

  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  void updater() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final passwordValue = useState<String>("");
    final usernameValue = useState<String>("");
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obsText = useState<bool>(true);
    final widthSize = MediaQuery.of(context).size.width;
    final model = useState(
      SignInModel(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        passwordValue: passwordValue,
        usernameValue: usernameValue,
        updateState: updater,
      ),
    );

    void login() {
      model.value = SignInModel(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        passwordValue: passwordValue,
        usernameValue: usernameValue,
        updateState: updater,
      );
      setState(() {});
      AuthServices().signIn(context, model: model.value);
    }

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
                if (model.value.usernameValue.value.isNotEmpty)
                  Text(
                    model.value.usernameValue.value,
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
                  child: TextField(
                    controller: usernameController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
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
                if (model.value.passwordValue.value.isNotEmpty)
                  Text(
                    model.value.passwordValue.value,
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
                          obscureText: obsText.value,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
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
                        onPressed: () {
                          obsText.value = !obsText.value;
                        },
                        icon: obsText.value
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
                    onPressed: login,
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
