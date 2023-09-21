import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'temp_settings_state.dart';

class TempSettingsProvider with ChangeNotifier {
  TempSettingState _state = TempSettingState.initial();
  TempSettingState get state => _state;

  void toggleTempUnit() {
    _state = _state.copyWith(
      tempUnit: _state.tempUnit == TempUnit.celcius
          ? TempUnit.fahrenheit
          : TempUnit.celcius,
    );
    print('temp unit $_state');
    notifyListeners(); 
  }
}
