import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future getData() async {
    http.Response response = await http.get(
        'https://corona-api.com/countries/IN');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getStateWiseData() async {
    http.Response stateWiseResponse = await http.get(
        'https://corona-virus-world-and-india-data.p.rapidapi.com/api_india',
        headers: {
          "x-rapidapi-key":
              "8d246925a6mshb43c72055ed7dc3p1ee5b9jsndb08e6b96f47",
          "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
        });
    if (stateWiseResponse.statusCode == 200) {
      return jsonDecode(stateWiseResponse.body);
    } else {
      print(stateWiseResponse.statusCode);
    }
  }
}
