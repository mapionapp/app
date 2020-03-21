import 'package:flutter/material.dart';
import 'package:w27/w27_colors.dart';

class InfoCardRow extends StatelessWidget {

  final String title;

  const InfoCardRow({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 200,
      decoration: BoxDecoration(
          color: W27Colors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      padding: EdgeInsets.all(10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 24),),
        ],
      ),
    );
  }
}
