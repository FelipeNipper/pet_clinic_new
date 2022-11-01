import 'package:flutter/material.dart';
import 'package:pet_clinic_new/models/pet.dart';
import 'package:pet_clinic_new/repositories/pet_repository.dart';
import 'package:pet_clinic_new/screens/mypets.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';
import 'package:pet_clinic_new/widgets/pet_input.dart';

class AddPets extends StatefulWidget {
  static const routeName = '/add';
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  final PetsRepository petsRepository = PetsRepository();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<String> petTypes = ['cat', 'dog', 'lizard', 'snake', 'bird', 'hamster'];

  void addPet(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      petsRepository.add(CreatePet(
          nome: _nome.text,
          dataNascimento: _dataNascimento.text,
          tipo: _itemSelecionado));

      print('ADICIONOU O PET');
      Navigator.of(context).pushNamed(MyPets.routeName);
    }
  }

  // late PetType petType;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Meu Novo Pet',
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
                          label: "Data de nascimento DD-MM-YYYY: ",
                        ),
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
                          onPressed: () => addPet(context),
                          child: const Text(
                            'ADICIONAR',
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
      ),
    );
  }

  String _itemSelecionado = 'cat';

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
