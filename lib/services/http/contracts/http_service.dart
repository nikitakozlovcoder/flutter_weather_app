typedef JsonConverter<T> = T Function(Map<String, dynamic>);

abstract class HttpService {
  Future<T> get<T>(String url, JsonConverter<T> jsonConverter);
  Future<List<T>> getList<T>(String url, JsonConverter<T> jsonConverter);

  Future<T> post<T>(String url, Object? body, JsonConverter<T> jsonConverter);
  Future<List<T>> postList<T>(String url, Object? body, JsonConverter<T> jsonConverter);

  Future<T> put<T>(String url, Object? body, JsonConverter<T> jsonConverter);
  Future<List<T>> putList<T>(String url, Object? body, JsonConverter<T> jsonConverter);

  Future<T> delete<T>(String url, Object? body, JsonConverter<T> jsonConverter);
  Future<List<T>> deleteList<T>(String url, Object? body, JsonConverter<T> jsonConverter);
}