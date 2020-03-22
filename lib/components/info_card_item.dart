import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w27/components/place/place_card.dart';
import 'package:w27/data/place.dart';
import 'package:w27/helper/popups.dart';
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
        height: 500,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
            SizedBox(height: 10,),
            TagRow(tags: ['Pasta', 'Toilet paper', 'Queue', 'open'],)
          ],
        ),
      ),
      onTap: () {
        Popups.generic(
          context: context,
          height: 400,
          content: PlaceCard(
            place: Place('test', name, address, []),
          )
        );
        //Navigator.push(context, CupertinoPageRoute(builder: (context) => CommentPage()));
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

class TagRow extends StatelessWidget {

  final List<String> tags;

  const TagRow({Key key, this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //scrollDirection: Axis.horizontal,
      children: tags.map((tag){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.all(3),
          child: Text(tag),
        );
      }).toList(),
    );
  }
}

