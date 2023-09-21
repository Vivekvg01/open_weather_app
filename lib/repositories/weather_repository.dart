import 'dart:developer';

import 'package:weather_app/exceptions/weather_exceptions.dart';
import 'package:weather_app/models/custom_error.dart';
import 'package:weather_app/models/direct_geocoding.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeoCoding directGeoCoding =
          await weatherApiServices.getDirectGeoCoding(city);

      final Weather tempWeather =
          await weatherApiServices.getWeather(directGeoCoding);

      final weather = tempWeather.copyWith(
        name: directGeoCoding.name,
        country: directGeoCoding.country,
      );

      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
