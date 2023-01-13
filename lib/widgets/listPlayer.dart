import '../models/banck.dart';
import '../screens/fantasy.dart';
import '../screens/viewPlayer.dart';

import '../models/players.dart';

import '../data.dart';
import 'package:flutter/material.dart';

class ListPlayer extends StatefulWidget {
  int index;
  var monyValue;
  ListPlayer(this.index, this.monyValue);

  @override
  State<ListPlayer> createState() => _ListPlayerState();
}

class _ListPlayerState extends State<ListPlayer> {
  players deffult = players("", "", "", "assets/images/2.jpg", 0, false, Colors.black);

  Color setcolor(Color icocolor) {
    icocolor = Colors.black;
    setState(() {
      if (((widget.index == 0 && deffult.location == "GK") ||
          (widget.index == 1 && deffult.location == "DF") ||
          (widget.index == 2 && deffult.location == "MD") ||
          (widget.index == 3 && deffult.location == "FW"))) {
        icocolor = deffult.injuredColor;
      }
    });
    return icocolor;
  }

  IconData seticon(IconData ico) {
    ico = Icons.no_accounts_outlined;
    setState(() {
      if (((widget.index == 0 && deffult.location == "GK") ||
          (widget.index == 1 && deffult.location == "DF") ||
          (widget.index == 2 && deffult.location == "MD") ||
          (widget.index == 3 && deffult.location == "FW"))) {
        ico = deffult.injuredIcon;
      }
    });
    return ico;
  }

  String setimage(String img) {
    img = "assets/images/2.jpg";
    setState(() {
      if (((widget.index == 0 && deffult.location == "GK") ||
          (widget.index == 1 && deffult.location == "DF") ||
          (widget.index == 2 && deffult.location == "MD") ||
          (widget.index == 3 && deffult.location == "FW"))) {
        img = deffult.image;
      }
    });
    return img;
  }

  @override
  Widget build(BuildContext context) {
    List data = dataPlayers.where((value) {
      if (widget.index == 0)
        return value.location == 'GK';
      else if (widget.index == 1)
        return value.location == 'DF';
      else if (widget.index == 2)
        return value.location == 'MD';
      else
        return value.location == 'FW';
    }).toList();

    return InkWell(
      onTap: () {
        setState(() {
          Navigator.of(context).pushNamed(ViewPlayer.nameRout,
              arguments: {"data": data, "deffult": deffult}).then((player) {
            player as players;
            setState(() {
              if (deffult.id != player.id &&
                  deffult.location == player.location) {
                Bank.sum(deffult.value_money);
                Bank.sup(player.value_money);
                widget.monyValue(Bank.totalValue);
              } else if (deffult.id != player.id) {
                Bank.sup(player.value_money);
                widget.monyValue(Bank.totalValue);
              }
              deffult = player;
            });
          });
        });
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    width: 110,
                    height: 110,
                    child: Image.asset(
                      setimage(deffult.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    seticon(deffult.injuredIcon),
                    color: setcolor(deffult.injuredColor),
                    size: 30,
                  ),
                ),
                Positioned(
                    child: Text(
                      deffult.location,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(.6)),
                    ),
                    left: 5,
                    top: 5),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(
                    "${deffult.value_money} \$",
                    style: TextStyle(
                        backgroundColor: Colors.black.withOpacity(.6),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Text(deffult.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   "${deffult.value_money} \$",
            //   style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.w700,
            //       color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
