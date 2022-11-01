import 'package:flutter/material.dart';
import 'package:pet_clinic_new/screens/add_pets.dart';
import 'package:pet_clinic_new/screens/edit_pets.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

import '../repositories/pet_repository.dart';
import '../widgets/card.dart';

class MyPets extends StatefulWidget {
  static const routeName = '/mypets';

  const MyPets({Key? key}) : super(key: key);

  @override
  State<MyPets> createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  final PetsRepository petsRepository = PetsRepository();

  @override
  Widget build(BuildContext context) {
    List<Widget> pets = buildPets(context);

    pets.insert(0, card(context, 'AddPets', route: AddPets.routeName));
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 136,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'My Pet\'s',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: pets,
          ),
        ],
      ),
    );
  }

  List<Widget> buildPets(BuildContext context) => petsRepository
      .getPets()
      .map((pet) => card(context, pet.nome,
          route: EditPets.routeName,
          arguments: PetIdArgument(petId: pet.id),
          imageName: pet.image))
      .toList();
}
