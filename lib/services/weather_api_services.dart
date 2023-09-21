import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/exceptions/weather_exceptions.dart';
import 'package:weather_app/models/direct_geocoding.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeoCoding> getDirectGeoCoding(String city) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: 'geo/1.0/direct',
      queryParameters: {
        'q': city,
        'limit': kLimit,
        'appid': dotenv.env['APPID']
      },
    );
    try {
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('cannot get the location of $city');
      }

      final directGeoCoding = DirectGeoCoding.fromJson(responseBody);

      return directGeoCoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(DirectGeoCoding directGeoCoding) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: 'data/2.5/weather',
        queryParameters: {
          'lat': '${directGeoCoding.lat}',
          'lon': '${directGeoCoding.lon}',
          'units': kUnit,
          'appid': dotenv.env['APPID']
        });
    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final weatherJson = json.decode(response.body);

      final Weather weather = Weather.fromJson(weatherJson);

      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
