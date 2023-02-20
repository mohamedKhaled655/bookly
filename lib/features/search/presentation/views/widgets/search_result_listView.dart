import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Opacity(
              opacity: .7,
              child: SizedBox(
                  width:275,
                  child: Text(
                    "deer end user , you can search by book name or category 😊 ",
                    style: Styles.textStyle18.copyWith(
                        fontStyle: FontStyle.italic,
                        fontSize:15.8),
                  )));
        } else if (state is SearchBooksSuccess) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    "Search Result :",
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    height:15,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder:(context, index)=>const Divider(color: Colors.white38),
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length>4?4:state.books.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: BookListViewItem(
                          booksModel: state.books,
                          index: index,
                        ), //BookListViewItem(booksModel: null,),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        } else if (state is SearchBooksFailure) {
          return

            CustomErrorWidget(errorText: state.errMessegr);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

   //   return const BookListViewItem(booksModel: [],index: 0,);