import 'package:bookly/features/search/presentation/views/widgets/search_result_listView.dart';
import 'package:flutter/material.dart';

import 'custom_search_textField.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
        child: Column(
          children: const [
            CustomSearchTextField(),
            SizedBox(height: 10,),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            //result
            SearchResultListView(),
          ],
        ),
      ),
    );
  }
}
