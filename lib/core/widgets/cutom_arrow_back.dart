import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CutomArrowBack extends StatelessWidget {
  const CutomArrowBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          GoRouter.of(context).pop();
        },
        child: Container(
        height: h10*6,
        width: h10*5.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(h15)),
          //color: Colors.blueGrey.withOpacity(.1),
         border: Border.all(color:Colors.white30 ),
        ),
        child:const Icon(FontAwesomeIcons.arrowLeft),
               ),
      );
  }
}