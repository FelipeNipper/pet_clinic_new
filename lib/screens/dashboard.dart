import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_clinic_new/screens/add_pets.dart';
import 'package:pet_clinic_new/screens/mypets.dart';

import '../widgets/card.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  Dashboard({Key? key}) : super(key: key);

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: SvgPicture.asset('lib/assets/images/menu.svg'),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child:
                SvgPicture.asset('lib/assets/images/BellAndNotification.svg'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 136,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your Pet\'s',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'is here now!',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: <Widget>[
              card(context, 'MyProfile'),
              card(context, 'MyPets',
                  onPressed: () =>
                      {Navigator.of(context).pushNamed(MyPets.routeName)}),
              card(context, 'Appointments'),
              card(context, 'MedicalRecords'),
              card(context, 'Notifications')
            ],
          ),
        ],
      ),
    );
  }
}
