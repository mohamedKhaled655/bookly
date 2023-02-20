import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: h30,right: h30,top: h10,bottom: h20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo,height: h20,),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.searchView);
            },
            child: Container(
            height: h50-h5,
            width: h50-h5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(h15)),
              color: Colors.blueGrey.withOpacity(.1),
            ),
            child:const Icon(FontAwesomeIcons.magnifyingGlass),
                   ),
          ),
        ],
      ),
    );
  }
}