import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:w27/api.dart';
import 'package:w27/data/place.dart';
import 'package:w27/language/language.dart';
import 'package:w27/routes/comment_page.dart';
import 'package:w27/w27_colors.dart';

enum Level { LOW, MED, HIGH }

class PlaceCard extends StatefulWidget {

  final double lat, lng;
  final Place place;

  const PlaceCard({Key key, this.lat, this.lng, this.place}) : super(key: key);

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {

  bool loading = true;
  List<Place> places;
  Place selectedPlace;

  @override
  void initState() {
    super.initState();

    if(widget.place != null) {
      places = [ widget.place ];
      selectedPlace = widget.place;
      loading = false;
    } else {
      API.getPlaces(widget.lat, widget.lng).then((data) {
        setState(() {
          loading = false;
          places = data;
          if(places.length == 1)
            selectedPlace = places.first;
        });
      });
    }

  }

  List<Widget> getWidgets() {
    if(loading) {
      // FETCHING DATA

      return [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitCubeGrid(
                  color: W27Colors.primaryColor,
                  size: 50.0,
                ),
                SizedBox(height: 50),
                Text(t('loading'), style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
        )
      ];
    } else {
      if(selectedPlace != null) {

        // SHOW ONE PLACE

        return [
          Text(selectedPlace.name, style: TextStyle(fontSize: 30)),
          PlaceInfoRow(icon: Icons.location_on, info: selectedPlace.address ?? t('placeCard.unknown')),
          Expanded(
            child: ListView(
              children: selectedPlace.comments.map((c) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 5),
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: W27Colors.secondaryColor, width: 5))
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(c.text, style: TextStyle(fontSize: 16)),
                      ...c.tags.map((tag) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: W27Colors.secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Text('#${tag.label}', style: TextStyle(color: Colors.white)),
                        );
                      }).toList()
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            color: W27Colors.primaryColor,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => CommentPage(
                place: selectedPlace,
                callback: (comment, tags) {
                  loading = true;
                  API.comment(selectedPlace.id, comment, tags).then((_) async {
                    selectedPlace = await API.getPlace(selectedPlace.id); // update place
                    setState(() {
                      loading = false;
                    });
                  });
                },
              )));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text(t('placeInfo.rate'), style: TextStyle(fontSize: 20, color: Colors.white))
                ]
              ),
            ),
          )
        ];
      } else {

        // CHOOSE ONE FROM MULTIPLE PLACES

        return [
          Text(t('placeInfo.selectPlace'), style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: places.map((p) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    color: W27Colors.primaryColor,
                    onPressed: () {
                      setState(() {
                        selectedPlace = p;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, size: 30, color: Colors.white),
                          SizedBox(width: 10),
                          Text(p.name, style: TextStyle(fontSize: 20, color: Colors.white))
                        ]
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getWidgets(),
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
          Icon(icon, size: 25),
          SizedBox(width: 10),
          Text(info, style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
