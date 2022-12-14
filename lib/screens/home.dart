import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_clinic_new/repositories/pet_repository.dart';
import 'dashboard.dart';
import '../core/util.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  Home({Key? key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed(Dashboard.routeName);
        await PetsRepository().loadPets();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(height: 15),
              Text(
                'Pet Clinic',
                style: TextStyle(
                    fontFamily: 'Pacifico', color: Colors.white, fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }
}
