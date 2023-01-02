import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/home/category_grid_view.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/theme/my_theme.dart';

import 'category.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  List<Category> category = [
    Category(
      categoryID: "Sports",
      categoryTitle: "SPORTS",
      categoryImage: "assets/images/sports.png",
      categoryBackground: Color.fromARGB(255, 201, 28, 34),
    ),
    Category(
        categoryID: "Politics",
        categoryTitle: "Politics",
        categoryImage: "assets/images/Politics.png",
        categoryBackground: Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryID: "Health",
        categoryTitle: "Healty",
        categoryImage: "assets/images/health.png",
        categoryBackground: Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryID: "Business",
        categoryTitle: "Business",
        categoryImage: "assets/images/bussines.png",
        categoryBackground: Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryID: "Environment",
        categoryTitle: "Environment",
        categoryImage: "assets/images/environment.png",
        categoryBackground: Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "Science",
        categoryTitle: "Science",
        categoryImage: "assets/images/science.png",
        categoryBackground: Color.fromARGB(255, 242, 211, 82)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: MyTheme.primaryLight),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        elevation: 0,
        title: Text('News'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: Stack(
        children: [
          Container(

            color: Colors.white,
            child: Image.asset('assets/images/background.png',fit: BoxFit.fill,),
            width: double.infinity,
            height: double.infinity,

          ),

          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pick Your Category \n OF Interest',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black45),),
                SizedBox(height: 12,),
                Expanded(
                  child: GridView.builder(
                    itemCount: category.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 6 / 7,
                    ),
                    itemBuilder: (context, index) =>
                        CategoryGridView(category: category[index], index: index),
                  ),
                ),

              ],
            ),
          ),
        ],

      ),
    );
  }
}
