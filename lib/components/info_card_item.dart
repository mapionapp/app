import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w27/language/language.dart';
import 'package:w27/routes/comment_page.dart';
import 'package:w27/w27_colors.dart';


class InfoCardItem extends StatelessWidget {

  final String name;
  final String address;
  final String distance;

  const InfoCardItem({Key key, this.name, this.distance, this.address}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        decoration: BoxDecoration(
          color: W27Colors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Text(name, style: TextStyle(color: Colors.white, fontSize: 22),),
            ),
            MetaInfoRow(icon: Icons.location_on, text: address,),
            MetaInfoRow(icon: Icons.directions, text: distance,),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => CommentPage()));
      },
    );
  }
}


class MetaInfoRow extends StatelessWidget {

  final IconData icon;
  final String text;

  const MetaInfoRow({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          child: Icon(icon, color: Colors.white,),
        ),
        Text(text, style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
