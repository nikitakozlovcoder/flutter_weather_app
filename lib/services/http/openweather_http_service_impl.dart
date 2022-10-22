import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/configuration/env.dart';
import 'package:myflutterapp/services/http/app_http_request.dart';
import 'package:myflutterapp/services/http/http_service_impl.dart';
import 'contracts/http_service.dart';
import 'http.enum.dart';

@named 
@Injectable(as: HttpService)
class OpenWeatherHttpServiceImpl extends HttpServiceImpl {
  final Env env;

  OpenWeatherHttpServiceImpl(this.env);

  @override
  FutureOr<AppHttpRequest> beforeHook(String url, HttpVerb verb,  Object? body) async {
    final req = await super.beforeHook(url, verb, body);
    final uri = req.uri.replace(queryParameters: {...req.uri.queryParameters}
      ..putIfAbsent('appid', () => env.openweathermapkey));
      
    return AppHttpRequest(
      uri: uri,
      body: req.body,
      headers: req.headers
    );
  }
}