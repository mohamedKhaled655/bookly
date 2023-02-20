import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/customButton.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/models/books.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appBar_book_details.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_rating_star.dart';

class BookViewDetailsBody extends StatelessWidget {
  final List<BookModel> books;
  final int index;
  const BookViewDetailsBody(
      {Key? key, required this.books, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

     var errorSnakBar = const SnackBar(
      shape:  StadiumBorder(),
      content: Text(
        "Opps there is an error ...",
        style: Styles.textStyle18,
      ),
      backgroundColor: Colors.deepPurple,
    );

    bool istrue=true;
    if(books[index].accessInfo!.pdf!.isAvailable??false){
      istrue=false;
    }

    return SafeArea(
      child: Column(
        children: [
          const CustomAppBarBookDetails(),
          CustomImageListViewItem(
              imageUrl: books[index].volumeInfo.imageLinks.thumbnail),
          SizedBox(
            height: h10 * 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              books[index].volumeInfo.title ?? "Not Found title",
              style: Styles.customTitle,
            ),
          ),
          SizedBox(
            height: h10 * .75,
          ),
          Text(books[index].volumeInfo.authors![0],
              style: Styles.textStyle18.copyWith(
                color: Colors.white30,
              )),
          SizedBox(
            height: h10,
          ),
          CustomRating(
              rating: books[index].volumeInfo.ratingsCount ?? 0,
              count: books[index].volumeInfo.ratingsCount ?? 0),
          SizedBox(
            height: h10,
          ),
          Container(
            padding: EdgeInsets.only(left: h10 * 4, right: h10 * 4),
            child: Row(children: [
              Expanded(
                child: CustomButton(
                 
                  onPressed: () async {
                    print("pressss");
                    final Uri urls = Uri.parse(books[index].volumeInfo.previewLink!);
                    try {
                      await canLaunchUrl(urls);
                      await launchUrl(
                        urls,
                        mode: LaunchMode.externalApplication,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(errorSnakBar);
                    }
                  },
                  text: books[index].saleInfo!.isEbook == true
                      ? "${books[index].saleInfo?.listPrice?.amount} €"
                      : "0 €",
                  textColor: Colors.black,
                  buttomColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(h10 * 1.7),
                      topLeft: Radius.circular(h10 * 1.7)),
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPressed:istrue?(){
                    ScaffoldMessenger.of(context).showSnackBar(errorSnakBar);
                  }: () async {
                    print("pressss");
                    final Uri urls = Uri.parse(books[index].accessInfo!.pdf!.acsTokenLink!);
                    try {
                      await canLaunchUrl(urls);
                      await launchUrl(
                        urls,
                        mode: LaunchMode.externalApplication,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(errorSnakBar);
                    }
                  },
                  text: books[index].saleInfo!.isEbook == true
                      ? "${books[index].saleInfo?.listPrice?.amount} €"
                      : "Free Preview",
                  textColor: Colors.white,
                  buttomColor: const Color(0xffEF8262),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(h10 * 1.7),
                      topRight: Radius.circular(h10 * 1.7)),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: h10 * 2,
          ),
          Container(
            height: h10 * 14,
            padding: const EdgeInsets.only(right: 20, left: 30),
            child: Text(books[index].volumeInfo.description ?? "",
                maxLines: 6, overflow: TextOverflow.ellipsis),
          ),
          books[index].volumeInfo.description == ""
              ? Container()
              : Expanded(
                  child: SizedBox(
                    height: h10 * 4,
                  ),
                ),
          Align(
              heightFactor: 0,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: h30),
                child: const Text(
                  "You can also like",
                  style: Styles.textStyle14,
                ),
              )),
          SizedBox(
            height: h10 * 2,
          ),
          //images
          Expanded(
            flex: 3,
            child: Container(
              height: h10 * 15,
              padding: EdgeInsets.only(left: h20, right: h20),
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookViewDetails,
                            extra: Books(booksModel: books, index: index));
                      },
                      child: CustomImageListViewItem(
                        imageUrl:
                            books[index].volumeInfo.imageLinks.smallThumbnail,
                      ));
                },
              ),
            ),
          ),
          SizedBox(
            height: h10 * 2,
          ),
        ],
      ),
    );
  }
}
