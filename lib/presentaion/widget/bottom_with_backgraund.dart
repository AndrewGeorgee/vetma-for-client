import 'package:flutter/material.dart';
import '../../core/resources/colors.dart';

class BottomWithBackgraund extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BottomWithBackgraund(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: ColorManager.prymaryColor,
        border: Border.all(
          color: ColorManager.prymaryColor,
          width: 5.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(35.0) //
            ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BottomWithBackgraund2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BottomWithBackgraund2(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: ColorManager.prymaryColor,
        border: Border.all(
          color: ColorManager.prymaryColor,
          width: 5.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(35.0) //
            ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center( 
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
