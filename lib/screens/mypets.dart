import 'package:flutter/material.dart';
import 'package:pet_clinic_new/screens/add_pets.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

import '../widgets/card.dart';

class MyPets extends StatefulWidget {
  static const routeName = '/mypets';

  const MyPets({Key? key}) : super(key: key);

  @override
  State<MyPets> createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  //List<Pets> pets = widget.petRepository.getAll();

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              card(context, 'AddPets', 'svg', 'Add Pets',
                  route: AddPets.routeName), //Ajustar para ser Onclick...
              card(context, 'Simba', 'png', 'Simba'),
              card(context, 'Bella', 'png', 'Bella'),
              card(context, 'Johny', 'png', 'Johny')
            ],
          ),
        ],
      ),
    );
  }
}
