import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/util.dart';

//import '../screens/home.dart';
class GenericCard extends StatefulWidget {
  final String imageName;
  final String text;
  final String onClickRoute;
  const GenericCard(this.imageName, this.text, this.onClickRoute, {super.key});

  @override
  State<GenericCard> createState() => _GenericCard();
}

class _GenericCard extends State<GenericCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.onClickRoute);
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
            SvgPicture.asset('lib/assets/images/${widget.imageName}'),
            const SizedBox(height: 20),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
