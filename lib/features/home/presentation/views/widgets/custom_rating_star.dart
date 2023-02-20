import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRating extends StatelessWidget {
  final int rating;
  final int count;
  const CustomRating({
    Key? key, this.rating=0, this.count=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar,color:const Color(0xffFFDD4F),size: h10+h5,),
        SizedBox(width:h5+2,),
        Text(rating==0?"0":"$rating",style: Styles.textStyle16,),
        SizedBox(width: h5,),
        count==0?const Text(""):Text( "($count)",style: Styles.textStyle14,),
      ],
    );
  }
}