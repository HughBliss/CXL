// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:cxl/dependency_injection.dart';
import 'package:cxl/environment.dart' as env;
import 'package:cxl/services/navigator_service.dart';

@singleton
class HttpClient {
  static final HttpClient _singleton = HttpClient._internal();

  factory HttpClient() {
    return _singleton;
  }

  HttpClient._internal();

  Dio get instance {
    final Dio dio = Dio();

    dio.options.baseUrl = env.Environment.ApiUrl;

    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;

    dio.interceptors.add(ErrorHandlerInterceptor());
    dio.interceptors.add(AuthInterceptor());

    return dio;
  }
}

class AuthInterceptor extends Interceptor {}

class ErrorHandlerInterceptor extends Interceptor {
  final NavigatorService _navigationService = getIt<NavigatorService>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _navigationService.pushReplacementNamed('/auth');
    }
    return super.onError(err, handler);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ' + token;
    }
    super.onRequest(options, handler);
  }
}
