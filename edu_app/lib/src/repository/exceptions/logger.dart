import 'dart:developer';

printer(dynamic message) {
  try {
    log("$message");
  } catch (e) {
    printer(message);
  }
}
