class ArticalModel {
  String url;
  String urlToImage;
  String title;
  String description;
  String author;
  dynamic publishedAt;
  String context;
  String content;

  ArticalModel({
    this.url,
    this.urlToImage,
    this.title,
    this.description,
    this.author,
    this.publishedAt,
    this.context,
    this.content,
  });

  ArticalModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    description = json['description'];
    author = json['author'];
    publishedAt = json['publishedAt'];
    context = json['context'];
    content = json['content'];
  }
}
