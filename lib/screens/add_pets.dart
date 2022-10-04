import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  void addPet() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            iconSize: 40,
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context, false),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child:
                  SvgPicture.asset('lib/assets/images/BellAndNotification.svg'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Text("Adicionar Pet"),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PetInput(controller: _nome, label: "Nome do Pet: "),
                        PetInput(controller: _idade, label: "Idade do Pet: "),
                        PetInput(controller: _raca, label: "Raça do Pet: "),
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
