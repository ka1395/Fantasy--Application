import 'package:advance_app/screens/fantasy.dart';
import 'listPlayer.dart';

import '../models/players.dart';

import '../data.dart';
import 'package:flutter/material.dart';

class CartPlayer extends StatefulWidget {
  final players playerData;
  bool checkPage;
  players playerDefult;

  CartPlayer(this.playerData, this.checkPage, this.playerDefult);

  @override
  State<CartPlayer> createState() => _CartPlayerState();
}

class _CartPlayerState extends State<CartPlayer> {
  Color checkSelect() {
    if (widget.playerData.unselect == true)
      return Theme.of(context).primaryColor;
    else
      return Colors.black.withOpacity(.6);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.playerDefult.name != "") widget.playerDefult.unselect = true;
        if (widget.playerData.unselect == false) return null;

        if (widget.checkPage == true) {
          setState(() {
            widget.playerData.unselect = false;
            Navigator.of(context).pop(widget.playerData);
          });
        }
      },
      child: Card(
        color: checkSelect(),
        elevation: 50,
        shadowColor: Colors.green,
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  widget.playerData.image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  child: Icon(
                    widget.playerData.injuredIcon,
                    color: widget.playerData.injuredColor,
                    size: 35,
                  ),
                  right: 0,
                  top: 0),
              Positioned(
                  child: Text(
                    widget.playerData.location,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        backgroundColor: Colors.black.withOpacity(1)),
                  ),
                  left: 5,
                  top: 5),
            ],
          ),
          Text(
            widget.playerData.name,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${widget.playerData.value_money} \$",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ]),
      ),
    );
  }
}