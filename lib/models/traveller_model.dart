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
}

class Travelpackage {
  int? adultcount;
  int? childrencount;
  int? roomscount;
  List<Traveler>? adults;
  List<Traveler>? children;

  Travelpackage(
      { this.adultcount,
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
}
