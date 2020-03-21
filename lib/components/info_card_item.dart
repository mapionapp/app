import 'package:flutter/material.dart';
import 'package:w27/language/language.dart';

import '../w27_colors.dart';

class InfoCardItem extends StatelessWidget {

  final String name;
  final String distance;
  final bool isOpen;
  final bool isFavorite;

  const InfoCardItem({Key key, this.name, this.distance, this.isFavorite, this.isOpen}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
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
          MetaInfoRow(icon: Icons.directions, text: distance,),
          MetaInfoRow(icon: Icons.access_time, text: isOpen ? t('infoCard.open') : t('infoCard.closed'),),
        ],
      ),
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
