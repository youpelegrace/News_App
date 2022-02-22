// To parse this JSON data, do
//
//     final healthCategory = healthCategoryFromJson(jsonString);

import 'dart:convert';

HealthCategory healthCategoryFromJson(String str) =>
    HealthCategory.fromJson(json.decode(str));

String healthCategoryToJson(HealthCategory data) => json.encode(data.toJson());

class HealthCategory {
  HealthCategory({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<HealthArticle>? articles;

  factory HealthCategory.fromJson(Map<String, dynamic> json) => HealthCategory(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<HealthArticle>.from(
            json["articles"].map((x) => HealthArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class HealthArticle {
  HealthArticle({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory HealthArticle.fromJson(Map<String, dynamic> json) => HealthArticle(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? "Unknown" : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author == null ? "Unknown" : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content == null ? null : content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
