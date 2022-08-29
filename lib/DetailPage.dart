import 'package:flutter/material.dart';
import 'package:flutter_application_2/PremiereLeagueModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.teams.strTeam.toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  widget.teams.strTeamBadge.toString(),
                  width: 200,
                  height: 250,
                ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name Club : " + widget.teams.strTeam.toString(),textAlign: TextAlign.left,),
                Text("\nFormed Year: " + widget.teams.intFormedYear.toString(),textAlign: TextAlign.left,),
                Text("\nStadion Name: "+widget.teams.strStadium.toString(),textAlign: TextAlign.left,),
                Text("\nStadion Capacity: "+widget.teams.intStadiumCapacity.toString(),textAlign: TextAlign.left,),
                Text("\nSocial Media:"
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          IconButton(onPressed: (){
                            var myUrl = "https://" + widget.teams.strTwitter.toString();
                            _launchInBrowser(myUrl);
                          },
                              icon: Image.asset("images/twt.jpg")),
                          Text("Twitter")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: (){
                            var myUrl = "https://" + widget.teams.strWebsite.toString();
                            _launchInBrowser(myUrl);
                          },

                            icon: Image.asset("images/web.png")),
                          Text("Website")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: (){
                            var myUrl = "https://" + widget.teams.strFacebook.toString();
                            _launchInBrowser(myUrl);
                          },
                              icon: Image.asset("images/fb.png")),
                          Text("Facebook")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: (){
                            var myUrl = "https://" + widget.teams.strInstagram.toString();
                            _launchInBrowser(myUrl);
                          },
                              icon: Image.asset("images/ig.png")),
                          Text("Instagram")
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Text(widget.teams.strDescriptionEN.toString()),
                ),
              ],
            ),
          ),
        ]),
      ),
    )));
  }
}
