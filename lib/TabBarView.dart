import 'package:flutter/material.dart';
import 'package:flutter_application_2/CardMatchView.dart';
import 'package:flutter_application_2/ListAllFootball.dart';
import 'package:flutter_application_2/Match.dart';



class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin{

  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: "Teams",),
    Tab(text: "Match",),
    Tab(text: "Eat & Drink",),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('Soccer'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListAllFootbal(),
           dashboard(),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),
      ),
    );
  }
}