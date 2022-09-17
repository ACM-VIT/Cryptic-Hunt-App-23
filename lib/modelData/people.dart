import 'dart:convert';

Starship starshipFromJson(String str) => Starship.fromJson(json.decode(str));

String starshipToJson(Starship data) => json.encode(data.toJson());

class Starship {
  int count = 0;
  String next = "";
  dynamic previous;
  List<Result> results;

  Starship({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  factory Starship.fromJson(Map<String, dynamic> json) => Starship(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;
  DateTime created;
  DateTime edited;
  String url;

  Result({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
