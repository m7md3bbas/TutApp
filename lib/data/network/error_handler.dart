//HTTP response status codes 200 - 299 - Success
//HTTP response status codes 300 - 399 - Redirection
//HTTP response status codes 400 - 499 - Client error
//HTTP response status codes 500 - 599 - Server error

enum ServerErrorType {
  success,
  badRequest,
  unAuthorized,
  forbidden,
  noContent,
  notFound,
  internalServerError,
  recieveTimeOut,
  sendTimeOut,
  cachError,
  noInternetConnection,
  connectTimeOut,
  cancel
}

class ResponseCode {
  //response code
  static const int success = 200; // success
  static const int noContent = 204; // success but no content
  static const int badRequest = 400; // api reject the request
  static const int unAuthorized = 401; //user is not authorized
  static const int forbidden =
      403; // user is not allowed to access the resource

  static const int notFound = 404; // resource not found
  static const int internalServerError = 500; // server error

  //local response code
  static const int unknown = -1;
  static const int noInternet = -2;
  static const int recieveTimeOut = -3; //
  static const int sendTimeOut = -4;
  static const int cachError = -5;
  static const int connectTimeOut = -6;
  static const int cancel = -7;
}

class ResponseMessage {
  static const String success = "Success"; // success
  static const String noContent = "No Content"; // success but no content
  static const String badRequest =
      "Bad Request , Please try again"; // api reject the request
  static const String unAuthorized = "UnAuthorized "; //user is not authorized
  static const String forbidden =
      "Forbidden Request"; // user is not allowed to access the resource

  static const String notFound = "Not Found"; // resource not found
  static const String internalServerError =
      "Somthing went wrong"; // server error

  //local response code
  static const String unknown = "Unknown Error";
  static const String noInternet = "Please check your internet connection";
  static const String recieveTimeOut = "Recieve Time Out"; //
  static const String sendTimeOut = "Send Time Out";
  static const String cachError = "Cach Error";
  static const String connectTimeOut = "Connect Time Out";
  static const String cancel = "Request Cancelled";
}
