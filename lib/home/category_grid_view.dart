import 'package:flutter/material.dart';
import 'package:news/home/category.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
  CategoryGridView({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: category.categoryBackground,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(index%2==0?25:0),
            bottomRight: Radius.circular(index%2==0?0:25),
            topRight: Radius.circular(25),
        topLeft: Radius.circular(25)),
      ),
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.categoryImage),
          Text(category.categoryTitle,style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),),
        ],
      ),
    );
  }
}
