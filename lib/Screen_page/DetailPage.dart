
import 'dart:ui';
import 'package:Soccers/FavDB.dart';
import 'package:Soccers/FavModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/material.dart';
import 'package:Soccers/API/PremiereLeagueModel.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{
  bool checkExist = false;
  Color colorChecked = Colors.grey;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  Future read() async {
    checkExist = await FavDatabase.instance.read(widget.teams.strTeam);
    setState(() {});
  }

  Future addData() async {
    var fav;
    fav = FavoriteModel(
        image: widget.teams.strTeamBadge.toString(),
        name: widget.teams.strTeam.toString(),
        julukan: widget.teams.strStadium.toString(),
        since: widget.teams.intFormedYear.toString());
    await FavDatabase.instance.create(fav);
    setState(() {
      checkExist = true;
    });
    // Navigator.pop(context);
  }

  Future deleteData() async {
    await FavDatabase.instance.delete(widget.teams.strTeam);
    setState(() {
      checkExist = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.favorite, size: 30),
              color:
              checkExist ? Colors.red : colorChecked,
              onPressed: () {
                checkExist ? deleteData() : addData();
              }),
        ],
        // title: Text(
        //   widget.teams.strTeam.toString(),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50)
                        ),
                        child: Image.network(widget.teams.strTeamFanart1.toString(),),
                      ),
                    ),

                    Positioned(
                      bottom: -40,
                        left: 20,
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(widget.teams.strTeamBadge.toString()),
                        ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      Container(
                        child:
                        Column(
                          children: [
                            Text(widget.teams.strTeam.toString(),
                            style: GoogleFonts.robotoMono(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),),
                            Text("Formed Year "+widget.teams.intFormedYear.toString(),
                            style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.w300,
                            ),),

                            SizedBox(height: 20,),

                            ReadMoreText(
                              widget.teams.strDescriptionEN.toString(),
                              style: GoogleFonts.roboto(),
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              lessStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor(widget.teams.strKitColour1.toString())
                              ),
                              trimExpandedText: 'Show less',
                              moreStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: HexColor(widget.teams.strKitColour1.toString()),
                              ),
                            ),
                          ],
                        ),),

                      SizedBox(height: 20,),

                      Container(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              child: Image.network(widget.teams.strStadiumThumb.toString(),
                              width: 200,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.teams.strStadium.toString(),
                                      style: GoogleFonts.roboto(),),
                                  Text(widget.teams.strStadiumLocation.toString(),
                                      style: GoogleFonts.roboto(),),
                                  Text("Capacity "+widget.teams.intStadiumCapacity.toString(),
                                      style: GoogleFonts.roboto(),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        child: Text(widget.teams.strStadiumDescription.toString(),
                            style: GoogleFonts.roboto(),),),

                      SizedBox(height: 30,),

                      Container(
                        child: Column(
                          children: [
                            Text("Jersey",
                                style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.w400,
                                ),),
                            SizedBox(height: 30,),
                            Image.network(widget.teams.strTeamJersey.toString(),
                            height: 200,
                            width: 200,)
                          ],
                        ),
                      ),

                      SizedBox(height: 40,),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            //facebook
                            InkWell(
                              onTap: (){
                                var myURL =
                                    "https://" + widget.teams.strFacebook.toString();
                                _launchInBrowser(myURL);},
                              child: Icon(
                                  FontAwesomeIcons.facebook,
                                    color: Colors.blue,),
                              ),

                            //twitter
                            InkWell(
                              onTap: (){
                                var myURL =
                                    "https://" + widget.teams.strTwitter.toString();
                                _launchInBrowser(myURL);},
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.lightBlue,),
                            ),

                            //instagram
                            InkWell(
                              onTap: (){
                                var myURL =
                                    "https://" + widget.teams.strInstagram.toString();
                                _launchInBrowser(myURL);},
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.deepOrange,),
                            ),

                             //youtube
                            InkWell(
                              onTap: (){
                                var myURL =
                                    "https://" + widget.teams.strYoutube.toString();
                                _launchInBrowser(myURL);},
                              child: Icon(
                                FontAwesomeIcons.youtube,
                                color: Colors.red,),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),
                    ],
                  ),
                )
              ],
          ),
        ),
    )
    );
  }
}
