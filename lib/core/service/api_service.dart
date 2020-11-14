import 'package:dio/dio.dart';
import 'package:github_search/core/helper/debug_utils.dart';


enum MethodRequest { POST, GET, PUT, DELETE }

class ApiService {
  static Dio _dio = Dio();

  ApiService(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 60000;
    _dio.options.receiveTimeout = 10000;
    _dio.options.headers = {'Accept': 'application/json'};
  }

  Future<Response> call(String url, {MethodRequest method = MethodRequest.POST, Map<String, dynamic> request, Map<String, String> header, String token, bool useFormData = false}) async {
    if(header != null){
      _dio.options.headers = header;
    }
    if(token != null){
      if(header != null){
        header.addAll({
          'X-Auth-Token': '$token'
        });
        _dio.options.headers = header;
      }else{
        _dio.options.headers = {
          'Accept': 'application/json',
          'X-Auth-Token': '$token'
        };
      }
      if(method == MethodRequest.PUT){
        _dio.options.headers = {
          'Accept': 'application/json',
          'X-Auth-Token': '$token',
          'Content-Type': 'application/x-www-form-urlencoded'
        };
      }
    }

    printDebug('URL : ${_dio.options.baseUrl}$url');
    printDebug('Method : $method');
    printDebug("Header : ${_dio.options.headers}");
    printDebug("Request : $request");
    var selectedMethod;
    try{
      Response response;
      switch (method) {
        case MethodRequest.GET:
          selectedMethod = method;
          response = await _dio.get(url, queryParameters: request);
          break;
        case MethodRequest.PUT:
          selectedMethod = method;
          response = await _dio.put(url,
            data: request,
          );
          break;
        case MethodRequest.DELETE:
          selectedMethod = method;
          response = await _dio.delete(
            url,
            data: useFormData ? FormData.fromMap(request) : request,
          );
          break;
        default:
          selectedMethod = MethodRequest.POST;
          response = await _dio.post(
            url,
            data: useFormData ? FormData.fromMap(request) : request,
          );
      }
      printDebug('Success $selectedMethod $url: \nResponse : ${response.data}');
      return response;
    } on DioError catch (e){
      printDebug('Error $selectedMethod $url: $e\nData: ${e.response?.data}');
      if(e.response?.data is Map){
        (e.response.data as Map).addAll(
            <String, dynamic>{
          "result": false,});
        return e.response;
      }else{
        Response response = Response(
            data: {
              "error": "Something wrong, please try again later",
              "result": false,
            }
        );
        return response;
      }
    }
  }
}
