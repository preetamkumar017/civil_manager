import 'package:http/src/multipart_file.dart';
abstract class BaseApiServices {

  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url , dynamic data);
  Future<dynamic> getPostWithFormDataApiResponse(String url, dynamic file , dynamic data);
  Future<dynamic> getPostWithFormDataAndJSONApiResponse(String url, List<MultipartFile> file , dynamic data);

}