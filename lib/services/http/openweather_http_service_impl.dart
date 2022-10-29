import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/configuration/env.dart';
import 'package:injectable_http_service/injectable_http_service.dart';

@named
@Injectable(as: HttpService<JsonSource>)
class OpenWeatherHttpServiceImpl extends JsonHttpServiceImpl {
  final Env _env;

  OpenWeatherHttpServiceImpl(this._env);

  @override
  FutureOr<AppHttpRequest> beforeHook(String url, HttpVerb verb, Object? body,
      Map<String, String>? headers, BodySerializer bodySerializer) async {
    final req =
        await super.beforeHook(url, verb, body, headers, bodySerializer);
    final uri = req.uri.replace(
        queryParameters: {...req.uri.queryParameters}
          ..putIfAbsent('appid', () => _env.openweathermapkey));

    return AppHttpRequest(uri: uri, body: req.body, headers: req.headers);
  }
}
