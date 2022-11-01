import '../core/util.dart';

class Pet {
  final int id;
  final String nome;
  final String dataNascimento;
  final String? image;
  final Type tipo;

  const Pet(
      {required this.id,
      required this.nome,
      required this.dataNascimento,
      required this.tipo,
      this.image});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        id: json['id'] as int? ?? -1,
        nome: json['name'] as String? ?? '',
        dataNascimento: json['birthDate'] as String? ?? '',
        tipo: Type.fromJson(json['type']),
        image: Util.getPhoto(Type.fromJson(json['type']).nome));
  }
}

class Type {
  final int? id;
  final String nome;

  const Type({this.id, required this.nome});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(id: json['id'] as int? ?? 1, nome: json['name'] as String);
  }
}

class CreatePet {
  final String nome;
  final String dataNascimento;
  final String tipo;

  const CreatePet({
    required this.nome,
    required this.dataNascimento,
    required this.tipo,
  });

  Pet toPet(int id) => Pet(
      id: id,
      nome: nome,
      dataNascimento: dataNascimento,
      image: Util.getPhoto(tipo),
      tipo: Type(id: 0, nome: tipo));
}
