import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:civil_manager/data/app_exceptions.dart';
import 'package:civil_manager/data/network/base_api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    log("NetworkApiService: $data");
    log("NetworkApiService: $url");
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));
      log(response.body.toString());
      responseJson = returnResponse(response);
      log(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }catch(e)
    {
      log(e.toString());
    }

    return responseJson;
  }

  @override
  Future getPostWithFormDataApiResponse(String url, file, data) async {
    dynamic responseJson;
// print("fdhthobject");
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields.addAll(data);
      request.files.addAll(file);
      var response = await request.send();
      // print(response.toString());
      var responseString = await response.stream.bytesToString().then((value){
        responseJson = returnResponseFile(response, value);
      });


    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }catch(e){debugPrint(e.toString());}
    print(responseJson.toString());
    return responseJson;
  }

  dynamic returnResponseFile(http.StreamedResponse response, responseString) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseString);
        return responseJson;
      case 202:
        throw AcceptedException(responseString);
      case 204:
        throw NoContentException(responseString);
      case 206:
        throw PartialContentException(responseString);
      case 302:
        throw FoundException(responseString);
      case 400:
        throw BadRequestException(response.stream.toString());
      case 401:
        throw UnauthorisedException(response.stream.toString());
      case 403:
        throw ForbiddenException(response.stream.toString());
      case 404:
        throw NotFoundException(response.stream.toString());
      case 406:
        throw NotAcceptableException(responseString);
      case 408:
        throw RequestTimeoutException(responseString);
      case 416:
        throw RequestedRangeNotSatisfiableException(responseString);
      case 500:
        throw InternalServerException(response.stream.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code ${response.statusCode}');
    }
  }

  dynamic returnResponse(http.Response response) {
    final responseString = response.body;
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseString);
        return responseJson;
      case 202:
        throw AcceptedException(responseString);
      case 204:
        throw NoContentException(responseString);
      case 206:
        throw PartialContentException(responseString);
      case 302:
        throw FoundException(responseString);
      case 400:
        throw BadRequestException(responseString);
      case 401:
        throw UnauthorisedException(responseString);
      case 403:
        throw ForbiddenException(responseString);
      case 404:
        throw NotFoundException(responseString);
      case 406:
        throw NotAcceptableException(responseString);
      case 408:
        throw RequestTimeoutException(responseString);
      case 416:
        throw RequestedRangeNotSatisfiableException(responseString);
      case 500:
        throw InternalServerException(responseString);
      case 503:
        throw ServiceUnavailableException(responseString);
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code ${response.statusCode}');
    }

  }

  @override
  Future getPostWithFormDataAndJSONApiResponse(String url, file, data) async {
    dynamic responseJson;

    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields['json'] = data;
      request.files.addAll(file);
      var response = await request.send();
      // print(response.toString());
      var responseString = await response.stream.bytesToString();
      responseJson = returnResponseFile(response, responseString);

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    // print(responseJson.toString());

    return responseJson;
  }

}
