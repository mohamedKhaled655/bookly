import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';

import 'newset_list_view_item.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  CustomAppBar(),
         const FuturedBooksListView(),
          SizedBox(
            height: h30+h10-2.5,
          ),
          Padding(
            padding: EdgeInsets.only(left: h20,right: h20),
            child:const Text("Best Seller",style: Styles.textStyle18),
          ),
          ///BestSellerListViewItems
           const NewsetListViewItem(),
        ],
      ),
    );
  }
}










