import 'package:flutter/material.dart';

import '../Classes/card_class.dart';
import 'cards.dart';

class ListViewHorizontally extends StatelessWidget {
  const ListViewHorizontally({super.key, required this.cards});
  final List<Cards> cards;
  //final Cards whichCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return UpperCards(
            card: cards[index],
          );
        },
      ),
    );
  }
}
