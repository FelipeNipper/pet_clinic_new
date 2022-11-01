import 'package:pet_clinic_new/models/pet.dart';

class PetsRepository {
  final List<Pet> _pets = [];

  PetsRepository() {
    _pets.addAll(const [
      Pet(id: 1, nome: 'Simba', idade: 2, raca: 'shitzu'),
      Pet(id: 2, nome: 'Bella', idade: 3, raca: 'bull terrier'),
      Pet(id: 3, nome: 'Johnny', idade: 4, raca: 'pastor alemao')
    ]);
  }

  void add(CreatePet createPet) {
    int id = _pets.length + 1;
    Pet pet = createPet.toPet(id);
    _pets.add(pet);
  }

  List<Pet> getall() => List.from(_pets);

  Pet get(int id) => _pets[id - 1];

  void update(Pet pet) => _pets[pet.id - 1] = pet;
}
