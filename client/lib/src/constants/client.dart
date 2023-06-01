import 'package:dio/dio.dart';

final dio = Dio()..options.baseUrl = 'https://feldspar.space';

// Future<void> prepareJar() async {
//   final Directory appDocDir = await getApplicationDocumentsDirectory();
//   final String appDocPath = appDocDir.path;
//   final jar = PersistCookieJar(
//     ignoreExpires: true,
//     storage: FileStorage("$appDocPath/.cookies/"),
//   );
//   dio.interceptors.add(CookieManager(jar));
// }
