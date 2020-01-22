import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConnectionModel {
  ApiConnectionModel(this.url);
  final String url;

  Future<void> getWeatherData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
