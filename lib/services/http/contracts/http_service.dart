typedef JsonConverter<T> = T Function(Map<String, dynamic>);

abstract class HttpService {
  Future<T> get<T>(String url, JsonConverter<T> jsonConverter);
  Future<List<T>> getList<T>(String url, JsonConverter<T> jsonConverter);
}