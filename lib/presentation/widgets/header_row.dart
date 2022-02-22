import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/view_model/news.dart';
import 'package:provider/src/provider.dart';

class HeaderRow extends StatelessWidget {
  HeaderRow({
    Key? key,
  }) : super(key: key);

  late NewsProvider _newsProvider;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _newsProvider = context.read<NewsProvider>();
    // print(_newsProvider.newsData?.articles?.length);
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: isLoading
          ? CircularProgressIndicator()
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(top: 15),
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Stack(
                  children: [
                    Positioned(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: _newsProvider
                            .newsData!.articles![index].urlToImage
                            .toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "images/png.png",
                          width: 500,
                          // height: 20,
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => Image.asset(
                          "images/png2.png",
                          width: 700,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 30,
                      child: SizedBox(
                        height: 140,
                        width: 250,
                        child: Text(
                            "${_newsProvider.newsData?.articles![index].title}",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30)),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: _newsProvider.newsData!.articles!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 15,
              ),
            ),
    );
  }
}
