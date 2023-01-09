import 'package:flutter/material.dart';
import 'package:news/category/tab_item.dart';
import 'package:news/models/SoucesResponse.dart';

import '../news/news_list.dart';

class TabContainer extends StatefulWidget {
  List<Source> sources;

  TabContainer({required this.sources});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((sources) => TabItem(
                      source: sources,
                      isSelected: selectedIndex == widget.sources.indexOf(sources)))
                  .toList(),
            ),

          ),
          Expanded(child: NewsList(source: widget.sources[selectedIndex],)),
        ],
      ),
    );
  }
}
