part of 'temp_settings_provider.dart';
 

enum TempUnit {
  celcius,
  fahrenheit,
}

class TempSettingState extends Equatable {
  final TempUnit tempUnit;
  TempSettingState({
     this.tempUnit = TempUnit.celcius,
  });


  factory TempSettingState.initial(){
    return TempSettingState();
  }

  @override
  List<Object> get props => [tempUnit];

  @override
  String toString() => 'TempSettingState(tempUnit: $tempUnit)';

  TempSettingState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
