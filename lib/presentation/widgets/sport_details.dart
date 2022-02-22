import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:provider/src/provider.dart';

class SportDetails extends StatelessWidget {
  final String image;
  final String author;
  final String content;
  SportDetails(
      {Key? key,
      required this.image,
      required this.author,
      required this.content})
      : super(key: key);
  late NewsProvider _newsProvider;

  @override
  Widget build(BuildContext context) {
    _newsProvider = context.watch<NewsProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ClipRRect(
            child: Hero(
              tag: "sport-image-$image",
              child: CachedNetworkImage(
                height: 360,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "images/png.png",
                  // width: 500,
                  // height: 20,
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) => Image.asset(
                  "images/png2.png",
                  // width: 700,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Author:',
                  // overflow: TextOverflow.,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(
                width: 5,
              ),
              author != null
                  ? Text("Unknown Author")
                  : Text(author,
                      // overflow: TextOverflow.,
                      style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(content,
              textAlign: TextAlign.center,
              // overflow: TextOverflow.,
              style: Theme.of(context).textTheme.subtitle2)
        ],
      ),
    );
  }
}
