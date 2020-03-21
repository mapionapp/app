import 'package:flutter/material.dart';
import 'package:w27/language/language.dart';
import 'package:w27/w27_colors.dart';

enum Level { LOW, MED, HIGH }

class PlaceCard extends StatelessWidget {

  final String title;
  final List<String> address;
  final bool isOpened;
  final Level usage;
  final List<String> shortages;

  const PlaceCard({Key key, this.title, this.address, this.isOpened, this.usage, this.shortages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 30)),
          ...address.map((a) => Text(a, style: TextStyle(fontSize: 20))),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: W27Colors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                PlaceInfoRow(icon: Icons.access_time, info: isOpened ? t('open') : t('closed')),
                PlaceInfoRow(icon: Icons.info, info: t('placeInfo.usage') + (usage == Level.LOW ? t('level.low') : (usage == Level.MED ? t('level.medium') : t('level.high')))),
                if(shortages.length != 0)
                  PlaceInfoRow(icon: Icons.warning, info: t('placeInfo.shortages') + shortages.fold('', (prev, curr) => prev == '' ? curr : prev + ', ' + curr)),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          FlatButton(
            onPressed: () {

            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 30),
                  SizedBox(width: 10),
                  Text(t('placeInfo.rate'), style: TextStyle(fontSize: 20))
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlaceInfoRow extends StatelessWidget {

  final IconData icon;
  final String info;

  const PlaceInfoRow({Key key, this.icon, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(icon, size: 25, color: Colors.white),
          SizedBox(width: 10),
          Text(info, style: TextStyle(fontSize: 18, color: Colors.white))
        ],
      ),
    );
  }
}
