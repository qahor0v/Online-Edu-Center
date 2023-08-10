import 'package:flutter/material.dart';

import '../colors.dart';

class NotificationPage extends StatelessWidget {
  static const String id = "notification_page";

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style:
              TextStyle(color: MyColors.textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/empty_page.png"))),
        ),
      ),
    );
  }
}
