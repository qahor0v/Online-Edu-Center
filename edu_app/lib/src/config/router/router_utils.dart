 import 'package:flutter/material.dart';

class Go {
  BuildContext context;

  Go(this.context);

  void close() {
    Navigator.pop(context);
  }

  void go(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void id(String id) {
    Navigator.pushReplacementNamed(context, id);
  }
}
