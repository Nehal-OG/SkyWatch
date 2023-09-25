import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sky_watch/presentation/resources/api_manager.dart';
import '../../application/app_constants.dart';
import '../../application/app_prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppPreferences appPreferences;
  DioFactory(this.appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      Constant.CONTENT_TYPE: Constant.APPLICATION_JSON,
      Constant.ACCEPT: Constant.APPLICATION_JSON,
    };

    dio.options = BaseOptions(
      headers: headers,
      baseUrl: APIManager.baseUrl,
      sendTimeout: const Duration(seconds: Constant.timeOut),
      receiveTimeout: const Duration(seconds: Constant.timeOut),
    );

    if (!kReleaseMode) {
      // app show logs of APIs in debug mode only not in release mode
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
