import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/models/books.dart';
import 'package:flutter/material.dart';

import 'widgets/book_view_details_body.dart';

class BookViewDetails extends StatelessWidget {
  final Books books;
  
  const BookViewDetails({ Key? key,required this.books, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object=${books.index}");
    return  Scaffold(
      body: BookViewDetailsBody(books:books.booksModel,index: books.index),
    );
  }
}

