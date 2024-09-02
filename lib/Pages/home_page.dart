import 'package:flutter/material.dart';
import 'package:news_app/Widgets/app_bar_widget.dart';
import 'package:news_app/Widgets/build_news_list_view.dart';
import 'package:news_app/Widgets/list_view.dart';
import '../Classes/card_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Cards> cards = const [
    Cards(imageCard: 'assets/images/business.jpeg', textCard: 'Business'),
    Cards(imageCard: 'assets/images/entertainment.jpg', textCard: 'Entertainment'),
    Cards(imageCard: 'assets/images/health.jpg', textCard: 'Health'),
    Cards(imageCard: 'assets/images/science.jpeg', textCard: 'Science'),
    Cards(imageCard: 'assets/images/sports.jpg', textCard: 'Sports'),
    Cards(imageCard: 'assets/images/technology.jpeg', textCard: 'Technology'),
  ];

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
             SliverToBoxAdapter(child: ListViewHorizontally(cards: cards)),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            NewsListViewBuilder(whichCategory: 'general'),
          ],
        ),

        // Column(
        //   children: [
        //     ListViewHorizontally(cards: cards),
        //     SizedBox(height: 30,),
        //     const Expanded(child: NewsListView()),
        //Padding(padding: EdgeInsets.only(top:20)),
        //NewsListView(),
        // ],
      ),
      //);
    );
  }
}
