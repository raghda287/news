import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SoucesResponse.dart';
import 'package:news/news/news_item.dart';
import 'package:news/theme/my_theme.dart';

class NewsList extends StatelessWidget {
Source source;
NewsList({required this.source});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(source.id??"" ), //ابعتلي استرينج فاضي لو هو ب null
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: MyTheme.primaryLight,));
          }
          if(snapshot.hasError){
            return Text('Error loading data ${snapshot.error.toString()}');
          }
          if(snapshot.data?.status=='error'){
            return Text('Server Error${snapshot.data?.message}');
          }
          var articles=snapshot.data?.articles;
          return ListView.builder(
            itemCount: articles?.length ?? 0,
              itemBuilder: (_,index)=> NewsItem(articles![index]),
          );
        },
      ),
    );
  }
}
