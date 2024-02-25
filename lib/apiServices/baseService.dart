abstract class BaseService {
  Future<dynamic> getResponse(String url, var headers);
  Future<dynamic> postResponse(String url, var body, var headers);
  Future<dynamic> putResponse(String url, var body, var headers);
  Future<dynamic> deleteResponse(String url, var headers);
  Future<dynamic> DeleteResponse(String url, var headers, var body);
  Future<dynamic> patchResponse(String url, var body, var headers);
}
