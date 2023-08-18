import 'package:edu_app/src/config/router/router_utils.dart';
import 'package:edu_app/src/ui/pages/colors.dart';
import 'package:edu_app/src/ui/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

void showCustomDialog({
  required BuildContext context,
  required String message,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          icon: Icon(
            Icons.error_outline,
            color: MyColors.myRed,
            size: 36,
          ),
          title: const Text("Xatolik"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              HBox(16.0),
              InkWell(
                onTap: () {
                  Go(context).close();
                },
                child: Text(
                  "Yopish",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ));
    },
  );
}

void showCustomDialogSuccess({
  required BuildContext context,
  required String message,
  required void Function() onTap,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Icon(
          IconlyLight.shield_done,
          color: MyColors.myGreen,
          size: 36,
        ),
        title: const Text("Muvaffaqiyatli"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            HBox(16.0),
            InkWell(
              onTap: onTap,
              child: Text(
                "Yopish",
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
