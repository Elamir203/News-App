import 'package:flutter/material.dart';
import 'package:news_app/Widgets/app_bar_widget.dart';
import 'package:news_app/Widgets/build_news_list_view.dart';

class CardsPage extends StatelessWidget {
  CardsPage({super.key, required this.whichCategory});
  final String whichCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        //body: ListViewHorizontally(cards: cards,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              NewsListViewBuilder(
                whichCategory: whichCategory,
              ),
            ],
          ),
        ));
  }
}
