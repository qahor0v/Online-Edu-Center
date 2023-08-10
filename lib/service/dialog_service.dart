import 'package:education/pages/sign_in_up_pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';

class DialogService {
  static Future<void> showDialog(
      BuildContext context, String title, String message) async {
    await showPlatformDialog(
      context: context!,
      builder: (_) => BasicDialogAlert(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          BasicDialogAction(
            onPressed: () {
              Get.to(() => SignInPage());
            },
            title: Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<bool?> showConfirmationDialog(
      BuildContext context, String title, String message) async {
    final result = await showPlatformDialog(
      context: context!,
      builder: (_) => BasicDialogAlert(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          BasicDialogAction(
            onPressed: () {
              Navigator.pop(context!, false);
            },
            title: Text('Cancel'),
          ),
          BasicDialogAction(
            onPressed: () {
              Navigator.pop(context!, true);
            },
            title: Text('OK'),
          ),
        ],
      ),
    );

    return result;
  }
}
