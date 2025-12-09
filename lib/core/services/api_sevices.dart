import 'package:dio/dio.dart';
import 'package:our_market_admin/core/services/sensitive_data.dart';

class ApiSevices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://mxgcypikbuuipodksmqe.supabase.co/rest/v1/",
      headers: {"apikey": anonKey},
    ),
  );

  Future<Response> getData(String path, String? token) async => await _dio.get(
    path,
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );

  Future<Response> postData(String path, Map<String, dynamic> data) async =>
      await _dio.post(path, data: data);

  Future<Response> patchData(
    String path,
    Map<String, dynamic> data,
    String? token,
  ) async => await _dio.patch(
    path,
    data: data,
    options: Options(headers: {"Authorization": "Bearer $token"}),
  );

  Future<Response> deleteData(String path, String? token) async =>
      await _dio.delete(
        path,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

  final Dio _dioAuth = Dio(
    BaseOptions(
      baseUrl: "https://mxgcypikbuuipodksmqe.supabase.co/auth/v1/",
      headers: {"apikey": anonKey},
    ),
  );
  Future<Response> createAnAccout(String endPoint, Map<String, dynamic> data) {
    return _dioAuth.post(endPoint, data: data);
  }

  Future<Response> login(String endPoint, Map<String, dynamic> data) {
    return _dioAuth.post(
      endPoint,
      data: data,
      queryParameters: {"grant_type": "password"},
    );
  }
}
