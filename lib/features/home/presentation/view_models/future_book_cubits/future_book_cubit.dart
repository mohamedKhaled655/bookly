import 'dart:ffi';

import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'future_book_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  static FeaturedBooksCubit get(context)=>BlocProvider.of(context);
  
  final HomeRepo homeRepo;

  Future<void>fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
    var result= await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errorMessage));
      print("errorMessage=${failure.errorMessage}");
    }, (books){
      emit(FeaturedBooksSuccess(books));
      print("books=$books");
    });
  }

}