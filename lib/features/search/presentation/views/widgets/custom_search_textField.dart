import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/cutom_arrow_back.dart';
import 'package:bookly/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchData=BlocProvider.of<SearchCubit>(context);
    
    return  Row(
      children: [
        const CutomArrowBack(),
          SizedBox(width: h10,),
        Expanded(
          child: TextField(
              decoration: InputDecoration(
          hintText: "Search",
          focusedBorder: buildOutlinedInputBorder(), 
          
          enabledBorder: buildOutlinedInputBorder(),
          suffixIcon: IconButton( onPressed: (){}, icon:  Icon(FontAwesomeIcons.magnifyingGlass,size: h10*2.2,)),
         // prefixIcon: IconButton(onPressed: (){}, icon:  Icon(Icons.close,size: h10*2.2,))
              ),
              
              onSubmitted: (String searchwords){
                print(searchwords);
            searchData.fetchSearchedBooks(searchString: searchwords);

              },
            ),
        )
      ],
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(h10)),
        borderSide:const BorderSide (
          color: Colors.white30
        ),
      );
  }
}

