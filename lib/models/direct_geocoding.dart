import 'package:equatable/equatable.dart';

class DirectGeoCoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;
  DirectGeoCoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory DirectGeoCoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];
    return DirectGeoCoding(
      name: data['name'],
      lat: data['lat'],
      lon: data['lon'],
      country: data['country'],
     );
  }

  @override
  List<Object> get props => [name, lat, lon, country];

  @override
  String toString() {
    return 'DirectGeoCoding(name: $name, last: $lat, lon: $lon, country: $country)';
  }
}


