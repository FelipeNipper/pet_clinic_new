import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/util.dart';

Widget card(context, String image, String imageType, String text,
    {String? route}) {
  return GestureDetector(
    onTap: () {
      if (route != null) {
        Navigator.of(context).pushNamed(route);
      } else {
        Navigator.pop(context);
      }
    },
    child: Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.BoxShadow,
            blurRadius: 20.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          imageType == 'svg'
              ? SvgPicture.asset('lib/assets/images/$image.svg')
              : Image.asset('lib/assets/images/$image.png'),
          const SizedBox(height: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    ),
  );
}
