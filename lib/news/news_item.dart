import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/news/news_details.dart';
import 'package:news/theme/my_theme.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  NewsItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: articles);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            ClipRRect(
              child :CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
            width: double.infinity,
            height: 200,
                placeholder: (context, url) => CircularProgressIndicator(color: MyTheme.primaryLight,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              borderRadius: BorderRadius.circular(18),

                ),

            Text(articles.author ?? ''),
            Text(articles.title ?? '',style: TextStyle(color: Colors.black,fontSize: 16),),
            Text(articles.publishedAt ?? '',textAlign: TextAlign.end,),
          ],
        ),
      ),
    );
  }
}
