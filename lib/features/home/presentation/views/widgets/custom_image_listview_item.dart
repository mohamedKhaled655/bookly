import 'package:bookly/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageListViewItem extends StatelessWidget {
  final String imageUrl;
  const CustomImageListViewItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: h5, right: h5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(h25)),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(h10 * 2)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          
          errorWidget: (context, url, error) =>const Center(
            child: SizedBox(
              width: 150,
              
              child: const Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
