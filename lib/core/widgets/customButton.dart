import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttomColor;
  final BorderRadius  borderRadius;
  
  final void Function()? onPressed;

  const CustomButton({
    Key? key,required this.text,required this.textColor,required this.buttomColor,required this.borderRadius, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return SizedBox(
      height: h50 - 2,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(color: textColor,fontWeight: FontWeight.w900),
        ),
        style: TextButton.styleFrom(
          backgroundColor: buttomColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius,
          ),
        ),
      ),
    );
  }
}