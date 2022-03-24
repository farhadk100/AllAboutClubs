import 'package:dio/dio.dart';

class DioManager{
  Future<dynamic> getRequest(
      String apiURL, Map<String, dynamic> parameters, Options options) async {
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.get(apiURL,
          queryParameters: parameters, options: options);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('http code: ${e.response!.statusCode} ${e.response!.statusMessage}');
      }
      return (e.response);
    }
  }

  Future<dynamic> putRequest(
      String apiURL, Map<String, dynamic> data, Options options) async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.put(apiURL, data: data, options: options);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('http code: ${e.response!.statusCode} ${e.response!.statusMessage}');
      }
      return (e.response);
    }
  }

  Future<dynamic> deleteRequest(
      String apiURL, Map<String, dynamic> data, Options options) async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.delete(apiURL, data: data, options: options);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('http code: ${e.response!.statusCode} ${e.response!.statusMessage}');
      }
      return (e.response);
    }
  }

  Future<dynamic> postRequest(
      String apiURL, Map<String, dynamic> data, Options options) async {
    try {
      Response response;
      Dio dio = new Dio();
      response = await dio.post(apiURL, data: data, options: options);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('http code: ${e.response!.statusCode} ${e.response!.statusMessage}');
      }
      return (e.response);
    }
  }
}