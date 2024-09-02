import 'package:flutter/material.dart';
import 'package:news_app/Pages/cards_page.dart';

import '../Classes/card_class.dart';

class UpperCards extends StatelessWidget {
  const UpperCards({super.key, required this.card});

  final Cards card;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return CardsPage(whichCategory: card.textCard);
        },
        ),
        );
      },
      child: Card(
        child: Container(
          height: 110,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(card.imageCard),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                card.textCard,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
