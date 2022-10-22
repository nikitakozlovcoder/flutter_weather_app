import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:myflutterapp/services/http/contracts/http_service.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HttpService)
class HttpServiceImpl implements HttpService {

  @override
  Future<T> get<T>(String url, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
    
    return _buildResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<List<T>> getList<T>(String url, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.get(uri);
   
    return _buildListResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<T> delete<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.delete(uri, body: body);
   
    return _buildResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<List<T>> deleteList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.delete(uri, body: body);
   
    return _buildListResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<T> post<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.post(uri, body: body);
   
    return _buildResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<List<T>> postList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.post(uri, body: body);
   
    return _buildListResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<T> put<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.put(uri, body: body);
   
    return _buildResult<T>(responce, jsonConverter);
  }
  
  @override
  Future<List<T>> putList<T>(String url, Object? body, JsonConverter<T> jsonConverter) async {
    final uri = Uri.parse(url);
    final responce = await http.put(uri, body: body);
   
    return _buildListResult<T>(responce, jsonConverter);
  }

  T _buildResult<T>(Response responce, JsonConverter<T> jsonConverter) {
    final json = jsonDecode(responce.body);

    return jsonConverter.call(json);
  }

  List<T> _buildListResult<T>(Response responce, JsonConverter<T> jsonConverter) {
    final json = jsonDecode(responce.body);
    final list = List<T>.generate(json.length,
      (index) => jsonConverter.call(json[index]));
  
    return list;
  }
}