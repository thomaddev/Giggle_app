import 'dart:convert';

import '../models/location.dart';
import 'core_provider.dart';

class LocationProvider {
  LocationProvider();

  String apiUrl = 'https://api.yourdomain.com/v1';

  Future<List<Location>> fetchLocations() async {
    final response = await CoreProvider().fetchApi("users?delay=1");
    return (json.decode(response.body)['data'] as List)
        .map((data) => Location.fromJson(data))
        .toList();
  }
}
