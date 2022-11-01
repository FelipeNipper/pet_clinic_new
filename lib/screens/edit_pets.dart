import 'package:flutter/material.dart';
import 'package:pet_clinic_new/models/pet.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

import '../core/util.dart';
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
  final TextEditingController _dataNascimento = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Pet pet;
  List<String> petTypes = ['cat', 'dog', 'lizard', 'snake', 'bird', 'hamster'];

  void editPet(BuildContext context, int petId) {
    if (_formKey.currentState!.validate()) {
      Pet pet = petsRepository.get(petId);

      petsRepository.update(Pet(
          id: petId,
          nome: _nome.text,
          dataNascimento: _dataNascimento.text,
          tipo: Type(nome: _itemSelecionado),
          image: Util.getPhoto(_itemSelecionado)));
      Navigator.of(context).pushNamed(MyPets.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    PetIdArgument petIdArgument =
        ModalRoute.of(context)!.settings.arguments as PetIdArgument;
    int petId = petIdArgument.petId;
    pet = petsRepository.get(petId);

    _nome.value = TextEditingValue(text: pet.nome);
    _dataNascimento.value = TextEditingValue(text: pet.dataNascimento);

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
                      PetInput(
                          controller: _dataNascimento,
                          label: "Data de nascimento DD-MM-YYYY: "),
                      const SizedBox(
                        height: 15,
                      ),
                      dropDown(),
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

  late String _itemSelecionado = pet.tipo.nome;

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      _itemSelecionado = novoItem;
    });
  }

  Widget dropDown() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            dropdownColor: Colors.white,
            items: petTypes.map(
              (e) {
                return DropdownMenuItem<String>(
                  value: e.toString(),
                  child: Text(e.toString()),
                );
              },
            ).toList(),
            onChanged: (String? novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado!);
              setState(() {
                _itemSelecionado = novoItemSelecionado;
              });
            },
            value: _itemSelecionado),
      ),
    );
  }
}
