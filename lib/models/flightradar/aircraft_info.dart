class AirCraftInfo {
  final String? registration;
  final String? manufacturename;
  final String? manufacturIcao;
  final String? model;
  final String? typecode;
  final String? serialnumber;
  final String? linenumber;
  final String? icaoAircraftclass;
  final String? selcel;
  final String? operator;
  final String? operatorcallsign;
  final String? operatoricao;
  final String? opearatoriata;
  final String? owner;
  final String? categorydiscription;
  final String? country;
  final String? icao24;
  final int? timeStamp;

  AirCraftInfo(
      {this.registration,
      this.manufacturename,
      this.manufacturIcao,
      this.model,
      this.typecode,
      this.serialnumber,
      this.linenumber,
      this.icaoAircraftclass,
      this.selcel,
      this.operator,
      this.operatorcallsign,
      this.operatoricao,
      this.opearatoriata,
      this.owner,
      this.categorydiscription,
      this.country,
      this.icao24,
      this.timeStamp});

  factory AirCraftInfo.fromJson(dynamic json) {
    if (json == null) {
      return AirCraftInfo();
    }
    return AirCraftInfo(
      registration: json['registration'],
      manufacturename: json['manufacturename'],
      manufacturIcao: json['manufacturIcao'],
      model: json['model'],
      typecode: json['typecode'],
      serialnumber: json['serialnumber'],
      linenumber: json['linenumber'],
      icaoAircraftclass: json['icaoAircraftclass'],
      selcel: json['selcel'],
      operator: json['operator'],
      operatorcallsign: json['operatorcallsign'],
      opearatoriata: json['opearatoriata'],
      operatoricao: json['operatoricao'],
      owner: json['owner'],
      categorydiscription: json['categorydiscription'],
      country: json['country'],
      icao24: json['icao24'],
      timeStamp: json['timeStamp'],
    );
  }
}
