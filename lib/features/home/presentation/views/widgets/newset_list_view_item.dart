import 'package:bookly/core/widgets/custom_loading_widget.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:bookly/features/home/presentation/view_models/newset_cubit/newset_cubit.dart';
import 'package:bookly/features/home/presentation/view_models/newset_cubit/newset_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_list_view_item.dart';

class NewsetListViewItem extends StatelessWidget {
  const NewsetListViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksStates>(
      builder: (context, state) {
        if(state is NewsetBooksSuccess){
          return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return  BookListViewItem(booksModel: state.books,index: index,);
            },
            separatorBuilder: (context, index) => const Divider(
              height: 1.2,
              indent: 20,
              endIndent: 20,
            ),
            itemCount: state.books.length,
          ),
        );
        }
        else if(state is NewsetBooksFailure){
          return CustomErrorWidget(errorText: state.errMessage);
        }
        else{
          return const Expanded(child:  CustomLoadingWidget());
        }
      },
    );
  }
}
