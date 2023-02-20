

import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

bool have_data=false;


  final HomeRepo homeRepo;

  Future<void> fetchSearchedBooks({required String searchString}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchSearchedBooks(searchString: searchString);
    if(result.length()>4){
      have_data=true;
      print("search♥♥=$result");
    }
    result.fold((failure) => emit(SearchBooksFailure(failure.errorMessage)),
            (books) => emit(SearchBooksSuccess(books)));



  }






}