import 'package:flutter/material.dart';
import 'package:news/helper/categori_news_data.dart';
import 'package:news/models/article_model.dart';
import 'package:news/src/appBar/my_app_bar.dart';
import 'package:news/src/methods/blog_tile.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticalModel> articles = List<ArticalModel>();
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  getNewsData() async {
    CategoryNewsData news = CategoryNewsData();
    await news.getCategoryData(widget.category);
    articles = news.newsData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                        content: articles[index].content,
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
