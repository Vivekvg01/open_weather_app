
part of 'theme_provider.dart';

enum AppTheme {
  light,
  dark,
}


class ThemeState extends Equatable {
  final AppTheme appTheme;
  ThemeState({
     this.appTheme = AppTheme.light,
  });

  factory ThemeState.inital(){
    return ThemeState();
  }
  

  @override
  List<Object> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';
}
