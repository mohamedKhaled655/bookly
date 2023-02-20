import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:bookly/features/home/data/models/books.dart';
import 'package:bookly/features/home/presentation/view_models/future_book_cubits/future_book_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/future_book_cubits/future_book_states.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FuturedBooksListView extends StatelessWidget {
  const FuturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      
      builder: (BuildContext context, state) { 
        if(state is FeaturedBooksSuccess){
          return Container(
        height: h250,
        padding: EdgeInsets.only(
            left: h20, right: h20),
        child: ListView.builder(
          itemCount: state.books.length,
          scrollDirection: Axis.horizontal,
          
          itemBuilder: (context, index) {
            return  GestureDetector(
              child: Padding(
                padding:const EdgeInsets.only(left: 5,right: 5),
                child: CustomImageListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,),
              ),
               onTap: (){
                   GoRouter.of(context).push(AppRouter.bookViewDetails,extra: Books(booksModel: state.books,index: index));
      },
              );
          },
        ),
      );
        }
        else if(state is FeaturedBooksFailure){
          return CustomErrorWidget(errorText: state.errMessage,);
        }
        else{
          return const CustomLoadingWidget();
        }
       },
      
    );
  }
}


