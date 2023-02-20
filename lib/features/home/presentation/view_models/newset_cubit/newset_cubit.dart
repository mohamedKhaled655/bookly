
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:bookly/features/home/presentation/view_models/newset_cubit/newset_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksStates> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

    static NewsetBooksCubit get(context)=>BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void>fetchNewestBooks()async{
    emit(NewsetBooksLoading());
     var result=await homeRepo.fetchNewsetBooks();
     result.fold((failure){
      emit(NewsetBooksFailure(failure.errorMessage));
      print("errorMessage=$failure.errorMessage");
     }, (news) {
      emit(NewsetBooksSuccess(news));
      print("news=$news");
     });
  }

}