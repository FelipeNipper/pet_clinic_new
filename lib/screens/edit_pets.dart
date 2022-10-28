import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

import '../widgets/pet_input.dart';

class EditPets extends StatefulWidget {
  static const routeName = '/edit';
  final String petId;
  final String petImage;
  final String petName;
  final String petImageType;

  const EditPets(
      {Key? key,
      required this.petId,
      required this.petImage,
      required this.petName,
      required this.petImageType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditPetsState();
  }
}

class _EditPetsState extends State<EditPets> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String petId;
  late TextEditingController petNameController;
  late TextEditingController petAgeController;
  late TextEditingController petRaceController;
  late String petImage;
  late String petImageType;

  _EditPetsState() {
    petId = widget.petId;
    petNameController = TextEditingController(text: widget.petName);
    petAgeController = TextEditingController();
    petRaceController = TextEditingController();
    petImage = widget.petImage;
    petImageType = widget.petImageType;
  }

  void editPet() {
    print('EDITOU O PET');
    print('nome: ${petNameController.text}');
    print('idade: ${petAgeController.text}');
    print('raça: ${petRaceController.text}');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  petImageType == 'svg'
                      ? SvgPicture.asset('lib/assets/images/$petImage.svg')
                      : Image.asset('lib/assets/images/$petImage.png'),
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
                        PetInput(
                            controller: petNameController,
                            label: "Nome do Pet: "),
                        const SizedBox(
                          height: 15,
                        ),
                        PetInput(
                            controller: petAgeController,
                            label: "Idade do Pet: "),
                        const SizedBox(
                          height: 15,
                        ),
                        PetInput(
                            controller: petRaceController,
                            label: "Raça do Pet: "),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.purple,
                              fixedSize: const Size(200, 50)),
                          onPressed: editPet,
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
      );
}
