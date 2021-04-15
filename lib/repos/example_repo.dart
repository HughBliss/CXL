// Project imports:
import 'package:cxl/dependency_injection.dart';
import 'package:cxl/models/example_model.dart';
import 'package:cxl/services/http_client.dart';

class ExampleRepo {
  final HttpClient _client = getIt<HttpClient>();

  Future<ExampleModel> fetchSomeData() async {
    final response = await _client.instance.get('/accounts');
    final exampleModelDto = ExampleModel.fromJson(response.data);
    return exampleModelDto;
  }
}
