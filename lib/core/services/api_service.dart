import 'package:dio/dio.dart';


const String base_url = 'https://dummyjson.com/';

class ApiService{

 final Dio _dio;

 ApiService(this._dio);

  get({required String endPoint}) async {
    final response = await _dio.get('$base_url$endPoint');
    return response.data;
  }

}