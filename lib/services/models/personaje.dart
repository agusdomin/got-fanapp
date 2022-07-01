import 'dart:convert';

List<Personaje> personajesFromJson(String str) =>
    List<Personaje>.from(json.decode(str).map((x) => Personaje.fromJson(x)));

String personajesToJson(List<Personaje> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PersonajeFields {
//   static final List<String> values = [
//     id,
//     firstName,
//     lastName,
//     fullName,
//     title,
//     family,
//     image,
//     imageUrl
//   ];
//   static final String id = 'id';
//   static final String firstName = 'firstName';
//   static final String lastName = 'lastName';
//   static final String fullName = 'fullName';
//   static final String title = 'title';
//   static final String family = 'family';
//   static final String image = 'image';
//   static final String imageUrl = 'imageUrl';
// }

class Personaje {
  Personaje({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  factory Personaje.fromJson(Map<String, dynamic> json) => Personaje(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        title: json["title"],
        family: json["family"],
        image: json["image"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "title": title,
        "family": family,
        "image": image,
        "imageUrl": imageUrl,
      };
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "firstName": firstName,
      "lastName": lastName,
      "fullName": fullName,
      "title": title,
      "family": family,
      "image": image,
      "imageUrl": imageUrl,
    };
  }
}
