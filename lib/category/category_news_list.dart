import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/category/tab_container.dart';
import 'package:news/home/category.dart';
import 'package:news/theme/my_theme.dart';

import '../models/SoucesResponse.dart';

class CategoryNewsList extends StatelessWidget {

Category category;
CategoryNewsList(this.category);
  @override
  Widget build(BuildContext context) {

    return Container(
      child: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(category.categoryID),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: MyTheme.primaryLight,));
            }
            if (snapshot.hasError) {
              return Text('Error loading data ${snapshot.error.toString()}');
            }
            if (snapshot.data?.status == 'error') {
              return Text('Server ${snapshot.error.toString()}');
            }
            return TabContainer(sources: snapshot.data?.sources??[]);
          }),
    );
  }
}
