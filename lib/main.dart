import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_clinic_new/screens/add_pets.dart';
import 'package:pet_clinic_new/screens/edit_pets.dart';

import 'core/util.dart';
import 'screens/home.dart';
import 'screens/dashboard.dart';
import 'screens/mypets.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: CustomColors.Yellow,
        fontFamily: 'Poppins',
      ),
      title: 'Pet Clinic',
      initialRoute: '/home',
      routes: {
        '/': (ctx) => Home(),
        Home.routeName: (ctx) => Home(),
        Dashboard.routeName: (ctx) => Dashboard(),
        MyPets.routeName: (ctx) => const MyPets(),
        AddPets.routeName: (ctx) => const AddPets(),
        EditPets.routeName: (ctx) => const EditPets(),
      },
      onGenerateRoute: (settings) {
        return;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => Home(),
        );
      },
    );
  }
}
