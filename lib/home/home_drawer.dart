import 'package:flutter/material.dart';
import 'package:news/theme/my_theme.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green,
            child:Center(child: Text('News App!',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white))),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.list,size: 30,),
                    SizedBox(width: 8,),
                    Text('Categories',style:  Theme.of(context).textTheme.headline6,),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.settings,size: 30,),
                    SizedBox(width: 8,),

                    Text('Settings',style:  Theme.of(context).textTheme.headline6,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
