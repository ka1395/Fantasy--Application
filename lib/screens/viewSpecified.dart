import 'package:advance_app/models/players.dart';
import 'package:advance_app/widgets/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/cartPlayer.dart';
import '../widgets/listPlayer.dart';

class ViewSpecified extends StatelessWidget {
  static const nameRout = "ViewSpecified";

  String setLocation(String s, int datalen) {
    if (datalen > 20) return "Players";
    if (s == "GK")
      return "GoalKeepers";
    else if (s == "DF")
      return "Defenders";
    else if (s == "MD")
      return "Midfielders";
    else if (s == "FW") return "FerWede";
    return s;
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "ALL  ${setLocation(data["data"]![0].location, data["data"]!.length)}"),
        automaticallyImplyLeading: false,
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        children: [
          ...data["data"]!
              .map((playerData) => CartPlayer(playerData, false,
                  players("", "", "", "", 0, false, Colors.black)))
              .toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
