import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:news_app/presentation/widgets/tech_detail.dart';
import 'package:provider/src/provider.dart';

class TechTab extends StatelessWidget {
  TechTab({
    Key? key,
  }) : super(key: key);
  late NewsProvider _newsProvider;

  @override
  Widget build(BuildContext context) {
    _newsProvider = context.watch<NewsProvider>();

    return SizedBox(
      height: 100,
      // width: 200,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final techNews = _newsProvider.category?.articles![index];
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TechDetails(
                                    image: techNews!.urlToImage.toString(),
                                    author: techNews.author.toString(),
                                    content: techNews.description.toString(),
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Hero(
                        tag: "tech-image-${techNews!.urlToImage}",
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: techNews.urlToImage.toString(),
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
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 55,
                        child: Text("${techNews.title}",
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: 17,
                            child: techNews.author == null
                                ? Text("Unknown")
                                : Text('${techNews.author}',
                                    // overflow: TextOverflow.,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                          ),
                          SizedBox(
                            width: 90,
                            height: 17,
                            child: Text('${techNews.publishedAt}',
                                // overflow: TextOverflow.,
                                style: Theme.of(context).textTheme.subtitle2),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: _newsProvider.category!.articles!.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10),
      ),
    );
  }
}
