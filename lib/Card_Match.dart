import 'package:flutter/material.dart';
import 'package:flutter_application_2/Constain.dart';
class ClassCard extends StatelessWidget {
  ClassCard({
    @required this.title,
    @required this.subtitle,
    required this.color,
    required this.assetImage

  });
  final String? title;
  final String? subtitle;
  final Color color;
  final AssetImage assetImage;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(4.5),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: assetImage,
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child:  ListTile(
          title: Text(
            title!,
            style: kwhiteTitleTextStyle,),
          subtitle: Text(subtitle!,style: resize ),
          trailing: Icon(Icons.more_vert, color: Colors.black87),
        ),
      ),
    );
  }
}