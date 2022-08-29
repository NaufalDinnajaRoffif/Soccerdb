import 'package:flutter/material.dart';

class cardView extends StatefulWidget {
  const cardView({Key? key}) : super(key: key);

  @override
  State<cardView> createState() => _cardViewState();
}

class _cardViewState extends State<cardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(
          child: Column(
            children: [
              Container(
                child: Image.network("https://asset.indosport.com/article/image/337032/as_roma_vs_juventus-169.jpg?w=600"),),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.network("https://media.vivagoal.com/2022/08/WhatsApp-Image-2022-08-26-at-13.56.03.jpeg"),),
            ],
          ),
        ),

        // child: Stack(
        //   children: [
        //     Ink.image(image: NetworkImage("https://asset.indosport.com/article/image/q/80/330429/liverpool_vs_chelsea_liga_inggris-169.jpg?w=750&h=423")),
        //   ],),
      ));
  }
}
