import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  final String image;
  final String title;
  final List<Widget> suptitle;

  const ListNews(this.title,this.image, this.suptitle);
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Theme.of(context).primaryColor,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      this.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  child: Icon(
                    Icons.new_releases_rounded,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Colors.black54,
                    child: Text(
                      this.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ),
                ),
               
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               
              ...suptitle.map((value) => value).toList(),
              ],
             
            ),
          ],
        ),
      ),
    );
  }
}
