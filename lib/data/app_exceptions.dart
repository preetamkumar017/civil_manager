import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppException implements Exception {
  final String? message;
  final String prefix;

  AppException([this.message, this.prefix = '']){
    Get.snackbar(prefix, "Contact to Developer",backgroundColor: Colors.red.withOpacity(0.8),colorText: Colors.white);
  }

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error ');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised ');
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Forbidden ');
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not Found ');
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, 'Internal Server Error ');
}

class FoundException extends AppException {
  FoundException([String? message]) : super(message, 'Found ');
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message])
      : super(message, 'Service Unavailable ');
}


class AcceptedException extends AppException {
  AcceptedException([String? message]) : super(message, 'Accepted ');
}

class NoContentException extends AppException {
  NoContentException([String? message]) : super(message, 'No Content ');
}

class PartialContentException extends AppException {
  PartialContentException([String? message])
      : super(message, 'Partial Content ');
}

class NotAcceptableException extends AppException {
  NotAcceptableException([String? message])
      : super(message, 'Not Acceptable ');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message])
      : super(message, 'Request Timeout ');
}

class RequestedRangeNotSatisfiableException extends AppException {
  RequestedRangeNotSatisfiableException([String? message])
      : super(message, 'Requested Range Not Satisfiable ');
}
