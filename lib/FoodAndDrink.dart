import 'package:flutter/material.dart';

class foodAndDrink extends StatefulWidget {
  const foodAndDrink({Key? key}) : super(key: key);

  @override
  State<foodAndDrink> createState() => _foodAndDrinkState();
}

class _foodAndDrinkState extends State<foodAndDrink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food & Drink"),
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 70,
                height: 70,
                child: Image.network("https://jubelio.com/wp-content/uploads/2021/09/kopi-janji-jiwaa.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
