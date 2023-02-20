import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorText;
  final double height;
  const CustomErrorWidget({ Key? key,required this.errorText,this.height=200 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: height,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            errorText,
            style: Styles.textStyle20,
          ),
        ),
    );
  }
}