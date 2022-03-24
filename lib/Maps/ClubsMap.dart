class ClubsMap {
  final List<Clubs>? clubs;

  ClubsMap({this.clubs});

  static List<Clubs> parseItems(json) {
    var list = json as List;
    List<Clubs> blogPosts =
    list.map((data) => Clubs.fromJson(data)).toList();
    return blogPosts;
  }

  factory ClubsMap.fromJson(List<dynamic> json) {
    return ClubsMap(clubs: parseItems(json));
  }
}

class Clubs {
  final String? id;
  final String? name;
  final String? country;
  final int? value;
  final String? image;
  final int? europeanTitles;
  final ClubStadium? clubStadium;
  final ClubLocation? clubLocation;

  Clubs({this.id,
    this.name,
    this.country,
    this.value,
    this.image,
    this.europeanTitles,
    this.clubStadium,
    this.clubLocation
  });

  factory Clubs.fromJson(Map<String, dynamic> json) {
    return Clubs(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      value: json['value'],
      image: json['image'],
      europeanTitles: json['european_titles'],
      clubStadium: ClubStadium.fromJson(json['stadium']),
      clubLocation: ClubLocation.fromJson(json['location']),
    );
  }
}

class ClubStadium{
  final int? size;
  final String? name;

  ClubStadium({this.name, this.size});

  factory ClubStadium.fromJson(Map<String, dynamic> json){
    return ClubStadium(
      size: json['size'],
      name: json['name']
    );
  }
}

class ClubLocation{
  final double? lat;
  final double? lng;

  ClubLocation({this.lat, this.lng});

  factory ClubLocation.fromJson(Map<String, dynamic> json){
    return ClubLocation(
      lat: json['lat'],
      lng: json['lng']
    );
  }
}