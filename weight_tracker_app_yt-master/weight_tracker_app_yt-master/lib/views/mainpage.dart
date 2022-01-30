import 'package:flutter/material.dart';

import 'package:weight_tracker_app_yt/models/quote_card.dart';
import 'package:weight_tracker_app_yt/models/quote.dart';

class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<home1> {
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'is about to loose 10 weight'),
    Quote(author: 'Frank Zappa.', text: 'is about to loose 9 weight'),
    Quote(author: 'Mahatma Gandhi', text: 'is about to loose 2 weight'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('notifications'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
