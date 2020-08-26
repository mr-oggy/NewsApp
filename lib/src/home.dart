import 'package:flutter/material.dart';
import 'package:news/common/loading.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news_data.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/categori_model.dart';
import 'package:news/src/methods/blog_tile.dart';
import 'package:news/src/methods/category_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticalModel> articles = List<ArticalModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategory();
    getNewsData();
  }

  getNewsData() async {
    NewsData news = NewsData();
    await news.getNewsData();
    articles = news.newsData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _loading
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    //categoryTile
                    Container(
                      height: 90,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),

                    //BlogTile
                    Container(
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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
