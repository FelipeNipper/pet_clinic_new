import 'package:flutter/material.dart';
import 'package:pet_clinic_new/models/pet.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

import '../repositories/pet_repository.dart';
import '../widgets/pet_input.dart';
import 'mypets.dart';

class PetIdArgument {
  final int petId;
  PetIdArgument({required this.petId});
}

class EditPets extends StatefulWidget {
  static const routeName = '/edit';

  const EditPets({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditPetsState();
  }
}

class _EditPetsState extends State<EditPets> {
  final PetsRepository petsRepository = PetsRepository();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _idade = TextEditingController();
  final TextEditingController _raca = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void editPet(BuildContext context, int petId) {
    Pet pet = petsRepository.get(petId);

    petsRepository.update(Pet(
        id: petId,
        nome: _nome.text,
        idade: int.parse(_idade.text),
        raca: _raca.text,
        image: pet.image));
    Navigator.of(context).pushNamed(MyPets.routeName);
  }

  @override
  Widget build(BuildContext context) {
    PetIdArgument petIdArgument =
        ModalRoute.of(context)!.settings.arguments as PetIdArgument;
    int petId = petIdArgument.petId;
    Pet pet = petsRepository.get(petId);

    _nome.value = TextEditingValue(text: pet.nome);
    _idade.value = TextEditingValue(text: pet.idade.toString());
    _raca.value = TextEditingValue(text: pet.raca);

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Image.asset('lib/assets/images/${pet.image}'),
                const Text(
                  'Editar Pet',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PetInput(controller: _nome, label: "Nome do Pet: "),
                      const SizedBox(
                        height: 15,
                      ),
                      PetInput(controller: _idade, label: "Idade do Pet: "),
                      const SizedBox(
                        height: 15,
                      ),
                      PetInput(controller: _raca, label: "Raça do Pet: "),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.purple,
                            fixedSize: const Size(200, 50)),
                        onPressed: () => editPet(context, petId),
                        child: const Text(
                          'EDITAR',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
