// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DetailScreen {
  String name;
  String image_url;
  String description;
  String rate;
  String id;
  DetailScreen(
      {required this.name,
      required this.image_url,
      required this.description,
      required this.rate,
      required this.id,
      data});

  DetailScreen copyWith({
    String? name,
    String? image_url,
    String? description,
    String? rate,
    String? id,
  }) {
    return DetailScreen(
      name: name ?? this.name,
      image_url: image_url ?? this.image_url,
      description: description ?? this.description,
      rate: rate ?? this.rate,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image_url': image_url,
      'description': description,
      'rate': rate,
      'id': id,
    };
  }

  factory DetailScreen.fromMap(Map<String, dynamic> map) {
    return DetailScreen(
      name: map['name'] as String,
      image_url: map['image_url'] as String,
      description: map['description'] as String,
      rate: map['rate'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailScreen.fromJson(String source) =>
      DetailScreen.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailScreen(name: $name, image_url: $image_url, description: $description, rate: $rate, id: $id)';
  }

  @override
  bool operator ==(covariant DetailScreen other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image_url == image_url &&
        other.description == description &&
        other.rate == rate &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image_url.hashCode ^
        description.hashCode ^
        rate.hashCode ^
        id.hashCode;
  }
}
