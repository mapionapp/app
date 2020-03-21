import 'package:flutter/material.dart';
import 'package:w27/components/info_card_item.dart';
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
          //color: W27Colors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.black, fontSize: 24),),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              //shrinkWrap: true,
              children: [
                InfoCardItem(isOpen: true, distance: '0,2 km', name: 'Kaufland',),
                InfoCardItem(isOpen: true, distance: '0,7 km', name: 'Edeka',),
                InfoCardItem(isOpen: true, distance: '1,2 km', name: 'Aldi',),
                InfoCardItem(isOpen: true, distance: '1,2 km', name: 'Futternapf',),
                InfoCardItem(isOpen: false, distance: '3 km', name: 'Zahnarzt Müller',),
                InfoCardItem(isOpen: true, distance: '3,2 km', name: 'Lidl',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
