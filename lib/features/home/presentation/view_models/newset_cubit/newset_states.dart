import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsetBooksStates extends Equatable {
  const NewsetBooksStates();

  @override
  List<Object> get props => [];
}

class NewsetBooksInitial extends NewsetBooksStates {}

class NewsetBooksLoading extends NewsetBooksStates {}

class NewsetBooksSuccess extends NewsetBooksStates {
  final List<BookModel> books;

  const NewsetBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewsetBooksStates {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}