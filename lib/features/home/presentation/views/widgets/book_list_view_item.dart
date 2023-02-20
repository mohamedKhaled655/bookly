import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/models/books.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_rating_star.dart';

class BookListViewItem extends StatelessWidget {
  final int index;
  final List<BookModel> booksModel;
  const BookListViewItem(
      {Key? key, required this.booksModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (booksModel.isEmpty && index == 0) {
      return const CustomErrorWidget(errorText: "Not Found Items");
    }

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookViewDetails,extra: Books(booksModel:booksModel,index: index ));
      },
      child: Container(
        height: h150 + h10,
        padding: EdgeInsets.only(left: h20, right: h20, top: h20, bottom: h20),
        child: Row(
          children: [
            Container(
              width: h100,
              height: h150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(h15)),
                color: Colors.blueGrey.withOpacity(.1),
              ),
              child: GestureDetector(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(h10 * 1.5)),
                    child: CachedNetworkImage(
                      imageUrl:
                          booksModel[index].volumeInfo.imageLinks.thumbnail,
                      fit: BoxFit.fill,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    ),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.bookViewDetails,extra: Books(booksModel:booksModel,index: index ));
                },
              ),
            ),
            SizedBox(
              width: h30,
            ),
            Expanded(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: h200,
                    child: Text(
                        booksModel[index].volumeInfo.title ?? "Without Title",
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h5, bottom: h10),
                    child: Text(
                      booksModel[index].volumeInfo.authors![0],
                      maxLines: 1,
                      style: Styles.textStyle14.copyWith(color: Colors.white30),
                    ),
                  ),

                  ///Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        booksModel[index].saleInfo!.isEbook==true?"${booksModel[index].saleInfo?.listPrice?.amount} €":"Free",
                        style: Styles.textStyle20,
                      ),
                      CustomRating(rating: booksModel[index].volumeInfo.averageRating??0,count:booksModel[index].volumeInfo.ratingsCount??0 ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
