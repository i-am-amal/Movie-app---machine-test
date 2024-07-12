import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app_machine_test/domain/model/movie_model.dart';

class ApiService {
  final String _baseUrl = 'https://hoblist.com/api';

  Future<List<MovieResponse>> fetchMovies() async {
    try {
      Map<String, dynamic> parameters = {
        "category": "movies",
        "language": "kannada",
        "genre": "all",
        "sort": "voting"
      };

      final response = await http.post(
        Uri.parse('$_baseUrl/movieList'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(parameters),
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> responseData = jsonDecode(response.body)['result'];
        return responseData
            .map((data) => MovieResponse.fromJson(data))
            .toList();
      } else {
        log('Failed to fetch data: ${response.reasonPhrase}');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Error fetching movies');
    }
  }
}
