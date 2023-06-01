import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioConfigurator {
  Dio configure(Dio client) => client
    ..options.contentType = 'application/json'
    ..interceptors.add(CookieManager(CookieJar()));
}
