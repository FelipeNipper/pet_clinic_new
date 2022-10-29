import 'package:flutter/material.dart';
import 'type.dart';

class Pet {
  final String id;
  final String name;
  final String birthDate;
  final Type type;

  const Pet({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.type,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        birthDate: json['birthDate'] as String? ?? '',
        type: Type.fromJson(json['type']));
  }
}
