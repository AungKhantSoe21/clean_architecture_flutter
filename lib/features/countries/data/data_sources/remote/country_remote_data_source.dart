import 'package:http/http.dart' as http;

class CountryDataSourceRemote {
  Future<http.Response> getCountries() async {
    Uri uri = Uri.parse("https://restcountries.com/v3.1/all");

    final response = await http.get(
      uri,
      headers: {
        'Accept': '*/*'
      },
    );

    return response;
  }
}