import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

final dio = Dio()
  ..options.baseUrl = 'https://feldspar.space'
  ..options.contentType = 'application/json'
  ..interceptors.add(CookieManager(CookieJar()));

// Future<void> prepareJar() async {
//   final Directory appDocDir = await getApplicationDocumentsDirectory();
//   final String appDocPath = appDocDir.path;
//   final jar = PersistCookieJar(
//     ignoreExpires: true,
//     storage: FileStorage("$appDocPath/.cookies/"),
//   );
//   dio.interceptors.add(CookieManager(jar));
// }
