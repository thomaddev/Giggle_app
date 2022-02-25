import '../constants/strings.dart';
import 'package:http/http.dart' as http;

class CoreProvider {
  Future<http.Response> fetchApi(String url) async {
    final response = await http.get(Uri.parse('${Strings.baseApi}/${url}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
