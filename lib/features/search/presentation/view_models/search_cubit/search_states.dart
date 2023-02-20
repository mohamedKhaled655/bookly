

import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';
// part  of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}
class SearchBooksSuccess extends SearchStates {
  final List<BookModel>books;

  SearchBooksSuccess(this.books);


}
class SearchBooksFailure extends SearchStates {
  final String errMessegr;

  SearchBooksFailure(this.errMessegr);
}