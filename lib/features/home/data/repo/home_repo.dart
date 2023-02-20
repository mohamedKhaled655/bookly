import 'package:bookly/core/errors/failure%20.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
   Future<Either<Failure,List<BookModel>>> fetchSearchedBooks({required searchString});

}
///هنا قول ال الفيتشر اللي هتتعمل بس ما قولش هتتعمل ازاي 