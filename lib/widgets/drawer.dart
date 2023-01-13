import 'package:advance_app/data.dart';
import 'package:advance_app/models/players.dart';
import 'package:advance_app/screens/viewPlayer.dart';
import 'package:advance_app/screens/viewSpecified.dart';
import 'package:flutter/material.dart';

class DrawerPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: Column(children: [
        Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.purple.withOpacity(.4), Colors.purple],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
            child: Row(
              children: [
                Icon(Icons.person, size: 30, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Players",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ViewSpecified.nameRout,
                arguments: {"data": dataPlayers});
          },
          iconColor: Colors.purple,
          leading: Icon(Icons.people),
          title: Text(
            "All players",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.sports_handball_rounded),
          iconColor: Colors.purple,
          onTap: () {
            Navigator.of(context).pushNamed(ViewSpecified.nameRout, arguments: {
              "data": dataPlayers.where((value) {
                return value.location == 'GK';
              }).toList()
            });
          },
          title: Text(
            "Goalkeeper",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ViewSpecified.nameRout, arguments: {
              "data": dataPlayers.where((value) {
                return value.location == 'DF';
              }).toList()
            });
          },
          iconColor: Colors.purple,
          leading: Icon(Icons.shield),
          title: Text(
            "Defenders",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ViewSpecified.nameRout, arguments: {
              "data": dataPlayers.where((value) {
                return value.location == 'MD';
              }).toList()
            });
          },
          iconColor: Colors.purple,
          leading: Icon(Icons.sports_kabaddi_rounded),
          title: Text(
            "Midfielders",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(ViewSpecified.nameRout, arguments: {
              "data": dataPlayers.where((value) {
                return value.location == 'FW';
              }).toList()
            });
          },
          iconColor: Colors.purple,
          leading: Icon(Icons.sports_soccer_rounded),
          title: Text(
            "FerWede",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
