import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  get({required String Link}) async {
    final response = await dio.get(Link);
    return response.data;
  }
}
