import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/home/category.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/theme/my_theme.dart';

import 'category_grid_view.dart';
import '../category/category_news_list.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> category = [
    Category(
      categoryID: "sports",
      categoryTitle: "SPORTS",
      categoryImage: "assets/images/sports.png",
      categoryBackground: const Color.fromARGB(255, 201, 28, 34),
    ),
    Category(
        categoryID: "politics",
        categoryTitle: "Politics",
        categoryImage: "assets/images/Politics.png",
        categoryBackground: const Color.fromARGB(255, 0, 62, 144)),
    Category(
        categoryID: "health",
        categoryTitle: "Healty",
        categoryImage: "assets/images/health.png",
        categoryBackground: const Color.fromARGB(255, 237, 30, 121)),
    Category(
        categoryID: "business",
        categoryTitle: "Business",
        categoryImage: "assets/images/bussines.png",
        categoryBackground: const Color.fromARGB(255, 207, 126, 72)),
    Category(
        categoryID: "entertainment",
        categoryTitle: "Entertainment",
        categoryImage: "assets/images/environment.png",
        categoryBackground: const Color.fromARGB(255, 72, 130, 207)),
    Category(
        categoryID: "science",
        categoryTitle: "Science",
        categoryImage: "assets/images/science.png",
        categoryBackground: const Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: MyTheme.primaryLight),
        shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        elevation: 0,
        title: Text(selectedCategory==null?'News':selectedCategory!.categoryTitle),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body:Stack(
        children: [
          Container(

            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/background.png',fit: BoxFit.fill,),

          ),

          selectedCategory==null?  Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pick Your Category \n OF Interest',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black45),),
                const SizedBox(height: 12,),
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
                        CategoryGridView(category: category[index], index: index, onClickItem: onClick),
                  ),
                ),

              ],
            ),
          ):CategoryNewsList(selectedCategory!),
        ],

      ),
    );
  }

  Category ?selectedCategory;

  void onClick(Category category){
    setState(() {
      selectedCategory=category;
    });
  }
}
