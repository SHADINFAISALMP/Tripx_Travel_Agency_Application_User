class AllState {
  final String? icao24;
  final String? callsign;
  final String? originCountry;
  final int? timePosition;
  final int? lastContact;
  final double? longitude;
  final double? latitude;
  final double? baroAltitude;
  final bool? onGround;
  final double? velocity;
  final double? verticalRate;
  final String? sensors;
  final double? truetract;
  final double? geoAltituce;
  final String? squawk;
  final bool? spi;
  final int? positionSource;

  AllState(
      {this.icao24,
      this.callsign,
      this.originCountry,
      this.timePosition,
      this.lastContact,
      this.longitude,
      this.latitude,
      this.baroAltitude,
      this.onGround,
      this.velocity,
      this.verticalRate,
      this.sensors,
      this.truetract,
      this.geoAltituce,
      this.squawk,
      this.spi,
      this.positionSource});

  factory AllState.fromJson(dynamic json) {
    if (json == null) {
      return AllState();
    }
    return AllState(
        icao24: json[0],
        callsign: (null != json[1]) ? json[1] : null,
        originCountry: json[2],
        timePosition: (null != json[3]) ? json[3] : null,
        lastContact: json[4],
        longitude: (null != json[5]) ? double.parse(json[5].toString()) : null,
        latitude: (null != json[6]) ? double.parse(json[6].toString()) : null,
        baroAltitude:
            (null != json[7]) ? double.parse(json[7].toString()) : null,
        onGround: json[8],
        velocity: (null != json[9]) ? double.parse(json[9].toString()) : null,
        truetract:
            (null != json[10]) ? double.parse(json[10].toString()) : null,
        verticalRate:
            (null != json[11]) ? double.parse(json[11].toString()) : null,
        sensors: (null != json[12]) ? json[12] : null,
        geoAltituce:
            (null != json[13]) ? double.parse(json[13].toString()) : null,
        squawk: (null != json[14]) ? json[14] : null,
        spi: json[15],
        positionSource: json[16]);
  }
}
