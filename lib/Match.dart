import 'package:flutter/material.dart';
import 'package:flutter_application_2/Card_Match.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0,),
        children: [
          ClassCard(
            title: 'Optus Stadium',
            subtitle: '11-5-2022',
            color: Colors.green,
            assetImage: AssetImage('images/as_vs_lp.jpg'),
          ),

          ClassCard(
            title: 'SoFi Stadium',
            subtitle: 'Abdul Jamil',
            color: Colors.orange,
            assetImage: AssetImage('images/as_vs_ws.jpg'),
          ),

          ClassCard(
            title: 'Tottenham Hotspur Stadium',
            subtitle: '28-5-23',
            color: Colors.blue,
            assetImage: AssetImage('images/bd_vs_lp.jpg'),
          ),
          ClassCard(
            title: 'Marvel Stadium',
            subtitle: '31-8-2022',
            color: Colors.grey,
            assetImage: AssetImage('images/Chelsea-vs-Tottenham.jpg'),

          ),
          ClassCard(
            title: 'Mercedes-Benz Stadium',
            subtitle: '1-9-2022',
            color: Colors.purpleAccent,
            assetImage: AssetImage('images/tth_vs_wh.jpg'),

          ),
        ],
      ),
    );
  }
}
