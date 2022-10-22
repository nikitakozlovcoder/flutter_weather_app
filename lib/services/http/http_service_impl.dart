import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/services/http/contracts/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/services/http/http.enum.dart';
import 'package:myflutterapp/services/http/app_http_request.dart';

@Injectable(as: HttpService)
class HttpServiceImpl implements HttpService {

  @override
  Future<T> get<T>(String url, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.get, null);
    var response = await http.get(req.uri, headers: req.headers);
    response = await afterHook(response);

    return _buildResult<T>(response, jsonConverter);
  }
  
  @override
  Future<List<T>> getList<T>(String url, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.get, null);
    var response = await http.get(req.uri, headers: req.headers);
    response = await afterHook(response);

    return _buildListResult<T>(response, jsonConverter);
  }
  
  @override
  Future<T> delete<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.delete, body);
    var response = await http.delete(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);

    return _buildResult<T>(response, jsonConverter);
  }
  
  @override
  Future<List<T>> deleteList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.delete, body);
    var response = await http.delete(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);

    return _buildListResult<T>(response, jsonConverter);
  }
  
  @override
  Future<T> post<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.post, body);
    var response = await http.post(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);

    return _buildResult<T>(response, jsonConverter);
  }
  
  @override
  Future<List<T>> postList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.post, body);
    var response = await http.post(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);
   
    return _buildListResult<T>(response, jsonConverter);
  }
  
  @override
  Future<T> put<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.put, body);
    var response = await http.put(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);
   
    return _buildResult<T>(response, jsonConverter);
  }
  
  @override
  Future<List<T>> putList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final req = await beforeHook(url, HttpVerb.put, body);
    var response = await http.put(req.uri, body: body, headers: req.headers);
    response = await afterHook(response);
   
    return _buildListResult<T>(response, jsonConverter);
  }

  FutureOr<AppHttpRequest> beforeHook(String url, HttpVerb verb, Object? body) async {
    return AppHttpRequest(uri: Uri.parse(url));
  }

  FutureOr<Response> afterHook(Response response) async {
    return response;
  }

  T _buildResult<T>(Response response, JsonConverter<T> jsonConverter) {
    final json = jsonDecode(response.body);

    return jsonConverter.call(json);
  }

  List<T> _buildListResult<T>(Response response, JsonConverter<T> jsonConverter) {
    final json = jsonDecode(response.body);
    final list = List<T>.generate(json.length,
      (index) => jsonConverter.call(json[index]));
  
    return list;
  }
}