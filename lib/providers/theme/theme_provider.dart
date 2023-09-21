import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/providers/providers.dart';

part 'theme_state.dart';

class ThemeProvider {
  final WeatherProvider wp;
  ThemeProvider({
    required this.wp,
  });

  ThemeState get state {
    if (wp.state.weather.temp > kWarmorNot) {
      return ThemeState();
    } else {
      return ThemeState(appTheme: AppTheme.dark);
    }
  }
}
