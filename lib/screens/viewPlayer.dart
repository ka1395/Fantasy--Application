import 'package:advance_app/models/banck.dart';
import 'package:advance_app/models/players.dart';
import 'package:flutter/material.dart';
import '../widgets/cartPlayer.dart';
import '../widgets/listPlayer.dart';

class ViewPlayer extends StatelessWidget {
  static const nameRout = "ViewPlayer";

  String setLocation(String s) {
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
            "${setLocation(data["data"]![0].location)} (Your Balance = ${Bank.totalValue.toStringAsFixed(1)}M \$)"),
        automaticallyImplyLeading: false,
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 151,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        children: [
          ...data["data"]!.map((playerData) {
            return CartPlayer(playerData, true, data["deffult"]);
          }).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          data["deffult"].unselect = true;
          Bank.sum(data["deffult"].value_money);
          Navigator.of(context)
              .pop(players("", "", "", "assets/images/2.jpg", 0, false, Colors.black));
        },
      ),
    );
  }
}
