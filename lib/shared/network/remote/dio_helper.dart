
// import 'package:dio/dio.dart';
//
//
//
//
// class DioHelper {
//   static late Dio dio;
//
//   static init(){
//     dio=Dio(
//       BaseOptions(
//         baseUrl: 'https://newsapi.org/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//   static Future<Response> getData({
//     required String url,
//     required Map<String, dynamic> query,
//   }) async
//   {
//     return await dio.get(
//       url,
//       queryParameters: query,
//     );
//   }
// }

import 'package:dio/dio.dart';



class DioHelper {
  static late Dio dio ;

  static init() {

    BaseOptions options = BaseOptions(
      baseUrl: 'https://newsapi.org/',
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }


  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}