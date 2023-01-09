import 'package:flutter/material.dart';
import 'package:news/models/SoucesResponse.dart';
import 'package:news/theme/my_theme.dart';

class TabItem extends StatelessWidget {
Source source;
bool isSelected;
TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
decoration: BoxDecoration(
  color: isSelected==true ? MyTheme.primaryLight:Colors.transparent,
  borderRadius: BorderRadius.circular(20),
  border: Border.all(color: MyTheme.primaryLight),
),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(source.name??"",style: TextStyle(color: isSelected==true?Colors.white:MyTheme.primaryLight),),
        ),
      ),
    );
  }
}
