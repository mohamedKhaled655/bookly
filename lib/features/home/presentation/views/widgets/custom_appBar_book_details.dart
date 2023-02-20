import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: h30,right: h30,top: h10,bottom: h20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){
              GoRouter.of(context).pop();
            },
           icon:const Icon(Icons.close,size: 30,),
           ),

           IconButton(
            onPressed: (){},
           icon:const Icon(Icons.shopping_cart_outlined,size: 25,),
           ),
        ],
      ),
    );
  }
}