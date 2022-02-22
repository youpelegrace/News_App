import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/category_news.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:news_app/presentation/widgets/sport_details.dart';
import 'package:provider/src/provider.dart';

class SpotsTab extends StatefulWidget {
  const SpotsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SpotsTab> createState() => _SpotsTabState();
}

class _SpotsTabState extends State<SpotsTab> {
  late NewsProvider _newsProvider;

  @override
  Widget build(BuildContext context) {
    _newsProvider = context.watch<NewsProvider>();
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final sportNews = _newsProvider.sportCategory?.articles![index];
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SportDetails(
                                    image: sportNews!.urlToImage.toString(),
                                    author: sportNews.author.toString(),
                                    content: sportNews.description.toString(),
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
                        tag: "sport-image-${sportNews!.urlToImage}",
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: sportNews.urlToImage.toString(),
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
                        child: Text("${sportNews.title}",
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
                            child: sportNews.author == null
                                ? Text("Unknown")
                                : Text('${sportNews.author}',
                                    // overflow: TextOverflow.,
                                    style:
                                        Theme.of(context).textTheme.subtitle2),
                          ),
                          SizedBox(
                            width: 90,
                            height: 17,
                            child: Text('${sportNews.publishedAt}',
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
        itemCount: _newsProvider.sportCategory!.articles!.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10),
      ),
    );
  }
}

class SportBuild extends StatelessWidget {
  final Article article;
  const SportBuild({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${article.title}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 5,
                ),
                Text('2 july 2021',
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.subtitle2),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
