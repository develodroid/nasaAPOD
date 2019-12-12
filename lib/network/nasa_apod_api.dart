import 'package:nasa_apod/data/apod_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NasaAPODApi {

  Future<APODItem> fetchAPOD() async {
    final JsonDecoder _decoder = new JsonDecoder();
    final response =
    await http.get('https://api.nasa.gov/planetary/apod?api_key=<>');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      final filmsContainer =  _decoder.convert(jsonBody);
      print(filmsContainer.toString());
      final APODItem aPODItem = APODItem.fromJson(filmsContainer);

      return aPODItem;
    } else {
      throw Exception('Failed to load post');
    }
  }
}