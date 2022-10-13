import 'dart:math';
import 'package:Soccers/FavDB.dart';
import 'package:Soccers/FavModel.dart';
import 'package:Soccers/TabBarView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class favPage extends StatefulWidget {
  favPage({Key? key}) : super(key: key);

  @override
  State<favPage> createState() => _favPageState();
}

class _favPageState extends State<favPage> {
  List<FavoriteModel> dataListFavorite = [];
  bool isLoading = false;
  Future read() async {
    setState(() {
      isLoading = true;
    });
    dataListFavorite = await FavDatabase.instance.readAll();
    print("Length List " + dataListFavorite.length.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  showDeleteDialog(BuildContext context, String? name) {
    // set up the button
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget okButton = TextButton(
        child: Text("Hapus"),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          await FavDatabase.instance.delete(name);
          read();
          setState(() {
            isLoading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder:(context) => home()));
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');

        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Apakah anda yakin ingin menghapus?"),
      actions: [cancelButton, okButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 10),
          child: isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : dataListFavorite.length == 0
              ? Center(
            child: Text("Kamu tidak memiliki tim Favorit"),
          )
              : ListView.builder(
            itemCount: dataListFavorite.length,
            itemBuilder: (c, index) {
              final item = dataListFavorite[index];
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(30),
                width: 315,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        offset: Offset(0.0, 4.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(right: 20),
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/greyepllogo.png',
                          image: item.image),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name,
                          style: GoogleFonts.robotoMono(),
                        ),
                        Text(
                          item.julukan,
                          style: GoogleFonts.robotoMono(),
                        )

                      ],
                    ),

                    Spacer(),
                    IconButton(
                      onPressed: () {
                        showDeleteDialog(context, item.name);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}