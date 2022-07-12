import 'package:flutter/material.dart';
import 'constants.dart';

class BottmButton extends StatelessWidget {

  final VoidCallback? onTap;
  String buttonText;

  BottmButton({@required this.onTap,@required this.buttonText='Sample'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonText,style: klargeButtonTextStyle,),),
        //alignment: Alignment.center,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
      ),
    );
  }
}