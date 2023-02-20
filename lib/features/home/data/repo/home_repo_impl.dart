import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/core/errors/failure%20.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo{
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
   try {
     var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance%20&q=subject:r");

    List<BookModel>books=[];
    for(var item in data["items"]){
      books.add(BookModel.fromJson(item));
    }
    return Right(books);

   }  catch (e) {
     if(e is DioError){
      return Left(ServiceFailure.fromDioError(e));
     }
    return Left(ServiceFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {
    try {
     var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&q=subject:Programming");
    //عملت الحوار دا عشان انا عامل المودل عباره عن الاوبجيكت اللي جوا ليست 
    List<BookModel>books=[];
    for(var item in data["items"]){
      books.add(BookModel.fromJson(item));
    }

    return Right(books);

   }  catch (e) {
     if(e is DioError){
      return Left(ServiceFailure.fromDioError(e));
     }
    return Left(ServiceFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required searchString}) async{
    List<BookModel> result = [];
    try {
      var data = await apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$searchString');
      for (var item in data['items']) {
        result.add(BookModel.fromJson(item));
      }
       data = await apiServices.get(endPoint: 'volumes?Filtering=free-ebooks&q=$searchString');
      for (var item in data['items']) {
        result.add(BookModel.fromJson(item));
      }

     // result.shuffle();
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}