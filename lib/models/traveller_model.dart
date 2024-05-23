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

  Travelpackage(
      {this.adultcount,
      this.childrencount,
      this.roomscount,
      this.adults,
      this.children});

  Map<String, dynamic> toJson() {
    return {
      'adultsCount': adultcount,
      'childrenCount': childrencount,
      'roomsCount': roomscount,
      'adults': adults!.map((e) => e.toJson()).toList(),
      'children': children!.map((e) => e.toJson()).toList(),
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
    );
  }
}
