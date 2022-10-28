import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';
import 'package:pet_clinic_new/widgets/pet_input.dart';

class AddPets extends StatefulWidget {
  static const routeName = '/add';

  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _idade = TextEditingController();
  final TextEditingController _raca = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addPet() {
    //Chamar o repo daqui
    print('ADICIONOU O PET');
    print('nome: ${_nome.text}');
    print('idade: ${_idade.text}');
    print('raça: ${_raca.text}');
  }

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
                          onPressed: addPet,
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
}
