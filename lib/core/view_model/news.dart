import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_url.dart';
import 'package:news_app/core/model/category_news.dart';
import 'package:news_app/core/model/general_news.dart';
import 'package:news_app/core/model/health_category.dart';
import 'package:news_app/core/model/sport_category.dart';
import 'package:news_app/core/services/networking.dart';

Networking network = Networking();

class NewsProvider extends ChangeNotifier {
  final Dio dio = Dio();
  GeneralCategory? _newsData;
  Category? _category;
  SportCategory? _sportCategory;
  HealthCategory? _healthCategory;
  GeneralCategory? get newsData => _newsData;
  Category? get category => _category;
  SportCategory? get sportCategory => _sportCategory;
  HealthCategory? get healthCategory => _healthCategory;

  Future<GeneralCategory?> getNewsDetails() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${ApiUrl.apiKey}';
    try {
      final response = await dio.get(url);
      final result = GeneralCategory.fromJson(response.data);
      // print(object)

      _newsData = result;
      print("grace");
      notifyListeners();
      // return result;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<Category?> techCategory() async {
    // print("grace");
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=1b53ece6d1ad498ebee23e28f9be7531';
    try {
      final response = await dio.get(
        url,
      );
      final result = Category.fromJson(response.data);

      _category = result;
      // print("grace");
      notifyListeners();
      // print(result.articles![0].description);
      // return result;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<HealthCategory?> healthsCategory() async {
    print("grace");
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=1b53ece6d1ad498ebee23e28f9be7531';
    try {
      final response = await dio.get(
        url,
      );
      final result = HealthCategory.fromJson(response.data);

      _healthCategory = result;
      print("grace");
      notifyListeners();
      // print(result.articles![0].description);
      // return result;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<SportCategory?> sportsCategory() async {
    print("grace");
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=1b53ece6d1ad498ebee23e28f9be7531';
    try {
      final response = await dio.get(
        url,
      );
      final result = SportCategory.fromJson(response.data);

      _sportCategory = result;
      print("grace");
      notifyListeners();
      // print(result.articles![0].description);
      // return result;
    } on DioError catch (e) {
      print(e);
    }
  }

  //  Future<Category> sportCategory(String country) async {
  //   const url =
  //       'top-headlines?country=us&category=sports&apiKey=${ApiUrl.apiKey}';
  //   try {
  //     final response = await dio.get(
  //       url,
  //     );
  //     final result = Category.fromJson(response.data);
  //     return result;
  //   } on DioError catch (e) {
  //     if (e.response != null && e.response!.data != '') {
  //       ErrorData result = ErrorData.fromJson(e.response!.data);
  //       throw result.message!;
  //     } else {
  //       throw e.error;
  //     }
  //   }
  // }
}
