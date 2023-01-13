import '../models/banck.dart';

import '../models/players.dart';

import '../widgets/cartPlayer.dart';
import '../widgets/drawer.dart';

import '../widgets/listPlayer.dart';
import 'package:flutter/material.dart';

class Fantasy extends StatefulWidget {
  static const String routName = "Fantasy";

  @override
  State<Fantasy> createState() => FantasyState();
}

class FantasyState extends State<Fantasy> {
  int dfCount = 1;

  int mdCount = 2;

  int fwCount = 1;
  double totalV = 45;

  void plans(BuildContext con) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).primaryColor,
        context: con,
        builder: (BuildContext context) {
          return GridView(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 130,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
            ),
            children: [
              Column(
                children: [
                  InkWell(
                    child: Image.asset(
                      "assets/images/211.jpg",
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      setState(() {
                        dfCount = 2;

                        mdCount = 1;

                        fwCount = 1;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "2 - 1 - 1",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    child: Image.asset(
                      "assets/images/112.jpg",
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      setState(() {
                        dfCount = 1;

                        mdCount = 1;

                        fwCount = 2;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "1 - 1 - 2",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Column(
                children: [
                  InkWell(
                    child: Image.asset(
                      "assets/images/121.jpg",
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      setState(() {
                        dfCount = 1;

                        mdCount = 2;

                        fwCount = 1;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "1 - 2 - 1",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          );
        });
  }

  Widget listBilder(int n, index) {
    if (n == 1) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListPlayer(index, set),
      ]);
    } else if (n == 2) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListPlayer(index, set),
        ListPlayer(index, set),
      ]);
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListPlayer(index, set),
    ]);
  }

  void set(double valu) {
    setState(() {
      totalV = valu;
    });
  }

  Color colorTotalv() {
    if (totalV < 0) return Colors.red;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPlayer(),
      appBar: AppBar(
        title: Text("Create Your Team"),
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.fill,
              )),
          ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return listBilder(1, index);
                } else if (index == 1) {
                  return listBilder(dfCount, index);
                } else if (index == 2) {
                  return listBilder(mdCount, index);
                } else if (index == 3) {
                  return listBilder(fwCount, index);
                } else {
                  return listBilder(1, index);
                }
              }),
          Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  plans(context);
                },
                child: Icon(
                  Icons.people_alt_outlined,
                ),
              )),
          Positioned(
            child: Text(
              "${totalV.toStringAsFixed(1)}M \$",
              style: TextStyle(
                  fontSize: 27,
                  color: colorTotalv(),
                  backgroundColor: Colors.black.withOpacity(.4)),
            ),
            top: 10,
            left: 15,
          ),
        ],
      ),
    );
  }
}
