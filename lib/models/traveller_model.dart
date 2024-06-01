class Traveler {
  String? name;
  int? age;

  Traveler({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Traveler.fromJson(Map<String, dynamic> json) {
    return Traveler(
      name: json['name'],
      age: json['age'],
    );
  }
}

class Travelpackage {
  int? adultcount;
  int? childrencount;
  int? roomscount;
  List<Traveler>? adults;
  List<Traveler>? children;
  String? packagename;
  String? packaageamount;
  String? adultprice;
  String? hotelprice;
  String? childprice;
  String? placename;
  String? days;
  String? night;
  String? startdate;
  String? endate;

  Travelpackage({
    required this.adultcount,
    required this.childrencount,
    required this.roomscount,
    required this.adults,
    required this.children,
    required this.packagename,
    required this.packaageamount,
    required this.placename,
    required this.adultprice,
    required this.childprice,
    required this.days,
    required this.endate,
    required this.hotelprice,
    required this.night,
    required this.startdate,
  });

  Map<String, dynamic> toJson() {
    return {
      'adultsCount': adultcount,
      'childrenCount': childrencount,
      'roomsCount': roomscount,
      'adults': adults!.map((e) => e.toJson()).toList(),
      'children': children!.map((e) => e.toJson()).toList(),
      'packagename': packagename,
      'packaageamount': packaageamount,
      'placename': placename,
      'adultprice': adultprice,
      'childprice': childprice,
      'days': days,
      'endate': endate,
      'hotelprice': hotelprice,
      'night': night,
      'startdate': startdate,
    };
  }

  factory Travelpackage.fromJson(Map<String, dynamic> json) {
    return Travelpackage(
      adultcount: json['adultsCount'],
      childrencount: json['childrenCount'],
      roomscount: json['roomsCount'],
      adults:
          List<Traveler>.from(json['adults'].map((x) => Traveler.fromJson(x))),
      children: List<Traveler>.from(
          json['children'].map((x) => Traveler.fromJson(x))),
      packagename: json['packagename'],
      packaageamount: json['packaageamount'],
      placename: json['placename'],
      adultprice: json['adultprice'],
      childprice: json['childprice'],
      days: json['days'],
      endate: json['endate'],
      hotelprice: json['hotelprice'],
      night: json['night'],
      startdate: json['startdate'],
    );
  }
}
