import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/services/http/app_http_request.dart';
import 'package:myflutterapp/services/http/http_service_impl.dart';
import 'contracts/http_service.dart';
import 'http.enum.dart';

@named 
@Injectable(as: HttpService)
class AuthHttpServiceImpl extends HttpServiceImpl {

  @override
  FutureOr<AppHttpRequest> beforeHook(String url, HttpVerb verb,  Object? body) async {
    log("beforeHook");
    return super.beforeHook(url, verb, body);
  }

  @override
  FutureOr<Response> afterHook(Response response) async {
    log("afterHook");
    return super.afterHook(response);
  }
}