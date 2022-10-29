import 'package:injectable/injectable.dart';
import 'package:injectable_http_service/injectable_http_service.dart';

@module
abstract class RegisterModule {
  @Injectable(as: HttpService<JsonSource>)
  JsonHttpServiceImpl get httpService =>
      JsonHttpServiceImpl(defaultBodySerializer: jsonBodySerializer);
}
