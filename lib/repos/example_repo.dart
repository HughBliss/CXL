import 'package:cxl/dependency_injection.dart';
import 'package:cxl/services/http_client.dart';

class ExampleRepo {
  final HttpClient _client = getIt<HttpClient>();

  Future<dynamic> fetchSomeData() async {
    var response = await _client.instance.get('/accounts');

    return response;
  }
}
