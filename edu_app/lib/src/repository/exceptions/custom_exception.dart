class CustomException {
  String message;
  int statusCode;

  CustomException({
    required this.statusCode,
    required this.message,
  });
}
