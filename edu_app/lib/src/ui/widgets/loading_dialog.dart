import 'package:edu_app/src/repository/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.black38,
          child: Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(
                AssetsPath.loadingAnimation,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      });
}
