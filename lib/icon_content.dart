import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData myicon;
  final String mytext;


  IconContent(
      {@required this.myicon = FontAwesomeIcons.mars, this.mytext = 'FEMALE'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myicon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          mytext,
          style: kTextLabelStyle,
        ),
      ],
    );
  }
}