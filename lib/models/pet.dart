class Pet {
  final int id;
  final String nome;
  final int idade;
  final String raca;
  final String image;

  const Pet(
      {required this.id,
      required this.nome,
      required this.idade,
      required this.raca,
      required this.image});

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
        id: json['id'] as int? ?? -1,
        nome: json['nome'] as String? ?? '',
        idade: json['idade'] as int? ?? -1,
        raca: json['raca'] as String? ?? '',
        image: json['image'] as String? ?? '');
  }
}

class CreatePet {
  final String nome;
  final int idade;
  final String raca;

  const CreatePet({
    required this.nome,
    required this.idade,
    required this.raca,
  });

  Pet toPet(int id) =>
      Pet(id: id, nome: nome, idade: idade, raca: raca, image: 'no-pet.png');
}
