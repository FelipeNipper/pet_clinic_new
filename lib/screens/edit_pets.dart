import 'package:flutter/material.dart';
import 'package:pet_clinic_new/widgets/app_bar.dart';

class EditPets extends StatefulWidget {
  const EditPets({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditPetsState();
  }
}

class _EditPetsState extends State<EditPets> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [],
        ),
      );
}
