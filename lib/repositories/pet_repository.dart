import 'dart:convert';

import 'package:http/http.dart';
import 'package:pet_clinic_new/core/api_constants.dart';
import 'package:pet_clinic_new/core/http_service.dart';
import 'package:pet_clinic_new/models/pet.dart';

class PetsRepository {
  HttpService service = HttpService();
  static final PetsRepository _repository = PetsRepository._internal();
  List<Pet> _pets = [];

  factory PetsRepository() {
    return _repository;
  }

  PetsRepository._internal() {
    // _pets.addAll(const [
    //   Pet(id: 1, nome: 'Simba', idade: 2, raca: 'shitzu', image: 'Simba.png'),
    //   Pet(
    //       id: 2,
    //       nome: 'Bella',
    //       idade: 3,
    //       raca: 'bull terrier',
    //       image: 'Bella.png'),
    //   Pet(
    //       id: 3,
    //       nome: 'Johny',
    //       idade: 4,
    //       raca: 'pastor alemao',
    //       image: 'Johny.png')
    // ]);
  }

  List<Pet> getPets() {
    return _pets;
  }

  Future<void> loadPets() async {
    try {
      Response response = await service.get(ApiConstants.pets);
      List<dynamic> responseJson = jsonDecode(response.body);

      List<dynamic> jsonData = <dynamic>[];
      _pets = <Pet>[];
      for (dynamic k in responseJson) {
        jsonData.add(k); //adding each value to the list
      }
      for (dynamic k in jsonData) {
        Pet pet = Pet.fromJson(k);
        _pets.add(pet);
      }
    } catch (e) {
      rethrow;
    }
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
