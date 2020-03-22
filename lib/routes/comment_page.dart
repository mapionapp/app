import 'package:flutter/material.dart';
import 'package:w27/api.dart';
import 'package:w27/components/place/place_card.dart';
import 'package:w27/data/place.dart';
import 'package:w27/data/tag.dart';
import 'package:w27/language/language.dart';
import 'package:w27/w27_colors.dart';

class CommentPage extends StatefulWidget {

  final Place place;
  final Function callback;

  const CommentPage({Key key, this.place, this.callback}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  String comment;
  String tagsRaw;
  List<Tag> tags = [];
  List<Tag> suggestions = [];

  Future<void> updateSuggestions() async {
    if(tagsRaw.isNotEmpty) {
      suggestions = await API.getTags(tagsRaw);
      suggestions = suggestions.where((s) => tags.every((tag) => tag.id != s.id)).toList(); // remove added tags
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: W27Colors.primaryColor,
          title: Text('W27'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.place.name, style: TextStyle(fontSize: 30)),
                  SizedBox(height: 10),
                  PlaceInfoRow(icon: Icons.location_on, info: widget.place.address ?? t('placeCard.unknown')),
                  SizedBox(height: 20),
                  Text(t('placeInfo.comment'), style: TextStyle(),),
                  SizedBox(height: 5),
                  TextFormField(
                    maxLines: 5,
                    onChanged: (input) {
                      comment = input;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2))
                    ),
                  ),
                  AnimatedContainer(
                    height: tags.length != 0 ? 40 : 0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCubic,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      children: tags.map((tag) {
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              tags = tags.where((existing) => existing != tag).toList();
                            });
                            await updateSuggestions();
                          },
                          child: Center(
                            child: Text('#${tag.label}', style: TextStyle(color: W27Colors.primaryColor))
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(t('placeInfo.tags'), style: TextStyle(),),
                  AnimatedContainer(
                    height: suggestions.length != 0 ? 40 : 0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCubic,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: suggestions.map((s) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              tags.add(s);
                              suggestions = suggestions.where((old) => old != s).toList();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 8, bottom: 8),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            decoration: BoxDecoration(
                              color: W27Colors.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Center(
                              child: Text(s.label, style: TextStyle(color: Colors.white))
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    onChanged: (input) async {
                      setState(() {
                        tagsRaw = input;
                        if(input.isEmpty)
                          suggestions = [];
                      });
                      await updateSuggestions();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2))
                    ),
                  ),
                  SizedBox(height: 50),
                  FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                    color: W27Colors.primaryColor,
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        widget.callback(comment, tags);
                      });
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
                ],
              ),
            )
          ],
        ),
    );
  }
}
