

class AirportInfo {
  final String? icao;
  final String? iata;
  final String? name;
  final Position? position;
  final String? continent;
  final String? country;
  final String? region;
  final String? municipality;
  final String? gpscode;
  final String? hompage;
  final String? wikipedia;

  AirportInfo(
      {this.icao,
      this.iata,
      this.name,
      this.position,
      this.continent,
      this.country,
      this.region,
      this.municipality,
      this.gpscode,
      this.hompage,
      this.wikipedia});

  factory AirportInfo.fromJson(dynamic json) {
    if (json == null) {
      return AirportInfo();
    }
    return AirportInfo(
      icao: json['icao'],
      iata: json['iata'],
      name: json['name'],
      position: Position.fromjson(json['position']),
      continent: json['continent'],
      country: json['country'],
      region: json['region'],
      municipality: json['municipality'],
      gpscode: json['gpscode'],
      hompage: json['hompage'],
      wikipedia: json['wikipedia'],
    );
  }
}

class Position {
  final double? longitude;
  final double? latitude;
  final double? altitude;
  final bool? reasonable;

  Position({this.longitude, this.latitude, this.altitude, this.reasonable});
  factory Position.fromjson(dynamic json) {
    if (json == null) {
      return Position();
    }
    return Position(
      longitude: json['longitude'],
      latitude: json['latitude'],
      altitude: json['altitude'],
      reasonable: json['reasonable'],
    );
  }
}
