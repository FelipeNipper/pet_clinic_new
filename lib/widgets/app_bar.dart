import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      color: Colors.black,
      iconSize: 40,
      icon: const Icon(Icons.chevron_left),
      onPressed: () => Navigator.pop(context, false),
    ),
    actions: <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: SvgPicture.asset('lib/assets/images/BellAndNotification.svg'),
      ),
    ],
  );
}
