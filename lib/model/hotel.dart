// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hotel {
  String name;
  String image_url;
  String id;
  Hotel({
    required this.name,
    required this.image_url,
    required this.id,
  });

  Hotel copyWith({
    String? name,
    String? image_url,
    String? id,
  }) {
    return Hotel(
      name: name ?? this.name,
      image_url: image_url ?? this.image_url,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image_url': image_url,
      'id': id,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      name: map['name'] as String,
      image_url: map['image_url'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) =>
      Hotel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Hotel(name: $name, image_url: $image_url, id: $id)';

  @override
  bool operator ==(covariant Hotel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image_url == image_url && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ image_url.hashCode ^ id.hashCode;
}
