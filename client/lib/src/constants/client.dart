import 'package:client/src/constants/client_configurator.dart'
    if (dart.library.io) 'package:client/src/constants/client_configurator_platform.dart'
    if (dart.library.html) 'package:client/src/constants/client_configurator_web.dart';
import 'package:dio/dio.dart';

final dio = DioConfigurator()
    .configure(Dio()..options.baseUrl = 'https://feldspar.space');

// Future<void> prepareJar() async {
//   final Directory appDocDir = await getApplicationDocumentsDirectory();
//   final String appDocPath = appDocDir.path;
//   final jar = PersistCookieJar(
//     ignoreExpires: true,
//     storage: FileStorage("$appDocPath/.cookies/"),
//   );
//   dio.interceptors.add(CookieManager(jar));
// }
