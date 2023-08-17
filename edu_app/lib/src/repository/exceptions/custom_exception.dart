class CustomException {
  String message;
  int statusCode;

  CustomException({
    required this.statusCode,
    required this.message,
  });

  static final CustomException e400 = CustomException(
    statusCode: 400,
    message:
        "So'rovda xatolik! Iltimos, ma'lumotlarni tekshirib qaytadan urinib ko'ring.",
  );

  static final CustomException e401 = CustomException(
    statusCode: 401,
    message: "Xatolik! Ro'yxatdan o'tilmagan",
  );
}

//100 Continue: The server confirms that it has received the request headers and the client should proceed to send the request body.
// 101 Switching Protocols: The server acknowledges the client's request to switch protocols and is changing to the new protocol.
// 2xx Successful Responses:
//
// 200 OK: The request was successful, and the server has returned the requested data.
// 201 Created: The request was successful, and a new resource was created as a result.
// 202 Accepted: The request has been accepted but not yet processed.
// 204 No Content: The request was successful, but there is no new information to send back.
// 3xx Redirection Responses:
//
// 300 Multiple Choices: The requested resource has multiple choices, each with its own URI and specific location.
// 301 Moved Permanently: The requested resource has been permanently moved to a new location.
// 302 Found (or 307 Temporary Redirect): The requested resource has been temporarily moved to a new location.
// 4xx Client Error Responses:
//
// 400 Bad Request: The request from the client is malformed or contains invalid data.
// 401 Unauthorized: The request requires user authentication or the authentication has failed.
// 403 Forbidden: The server understood the request, but the server refuses to authorize it.
// 404 Not Found: The requested resource could not be found on the server.
// 405 Method Not Allowed: The requested method is not allowed for the specified resource.
// 5xx Server Error Responses:
//
// 500 Internal Server Error: The server encountered an error while processing the request.
// 501 Not Implemented: The server does not support the functionality required to fulfill the request.
// 502 Bad Gateway: The server, while acting as a gateway or proxy, received an invalid response from the upstream server.
// 503 Service Unavailable: The server is currently unable to handle the request due to temporary overloading or maintenance of the server.
// 504 Gateway Timeout: The server, while acting as a gateway or proxy, did not receive a timely response from the upstream server.
