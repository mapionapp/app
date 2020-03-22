
import 'dart:convert';

import 'package:http/http.dart';
import 'package:w27/data/comment.dart';
import 'package:w27/data/place.dart';
import 'package:w27/data/tag.dart';
import 'package:w27/helper/sleep.dart';

class API {
  static const String URL = 'https://w27-wvs.alexdev.de';
  
  static Future<Response> doGet(String route) {
    print('GET REQUEST: $URL/$route');
    return get('$URL/$route');
  }

  static Future<Response> doPost(String route, Map<String, dynamic> data) {

    var body = json.encode(data);
    print('PUT REQUEST: $URL/$route | data: $data');
    return post(
      '$URL/$route',
      headers: {
        'content-type': 'application/json'
      },
      body: body
    );
  }

  static const test = """
  [{
  "id": "5e762dc12345c9737f79adc1",
  "placeId": "ChIJN1t_tDeuEmsRUsoyG83frY4",
  "name": "Google Australia",
  "placeType": [
    "point_of_interest",
    "establishment"
  ],
  "location": {
    "lat": -33.8666114,
    "lng": 151.1958324
  },
  "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
  "googleUrl": "https://maps.google.com/?cid=10281119596374313554",
  "vicinity": "48 Pirrama Road, Sydney",
  "comments": [
    {
      "id": "5e7639e63f0e40370dd95e04",
      "content": "Kein Klopapier",
      "tags": ["Food"],
      "createdAt": "2020-03-21T15:59:34.292Z"
    },
    {
      "id": "5e7639e63f0e40370ddwrwe95e04",
      "content": "Ich musste 2h warten",
      "tags": ["Queue", "Long"],
      "createdAt": "2020-03-22T12:01:34.292Z"
    }
  ]
},
{
  "id": "5e762dc12345c9737f79adc1",
  "placeId": "ChIJN1t_tDeuEmsRUsoyG83frY4",
  "name": "Google Australia",
  "placeType": [
    "point_of_interest",
    "establishment"
  ],
  "location": {
    "lat": -33.8666114,
    "lng": 151.1958324
  },
  "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/generic_business-71.png",
  "googleUrl": "https://maps.google.com/?cid=10281119596374313554",
  "vicinity": "48 Pirrama Road, Sydney",
  "comments": [
    {
      "id": "5e7639e63f0e40370dd95e04",
      "content": "Kein Klopapier",
      "tags": ["Food"],
      "createdAt": "2020-03-21T15:59:34.292Z"
    },
    {
      "id": "5e7639e63f0e40370ddwrwe95e04",
      "content": "Ich musste 2h warten",
      "tags": ["Queue", "Long"],
      "createdAt": "2020-03-22T12:01:34.292Z"
    }
  ]
}
]
  """;

  static Future<List<Place>> getPlaces(double lat, double lng) async {
    Response response = await doGet('v1/places/$lat/$lng');
    List<dynamic> places = json.decode(response.body);
    //await sleep(3000);
    //List<dynamic> places = json.decode(test);
    print(places);
    return places.map((p) {
      Map<String, dynamic> map = p as Map;
      return _parsePlace(map);
    }).toList();
  }

  static Future<Place> getPlace(String id) async {
    Response response = await doGet('v1/place/$id');
    Map<String, dynamic> map = json.decode(response.body);
    return _parsePlace(map);
  }

  static Future<List<Tag>> getTags(String query) async {
    Response response = await doGet('v1/tags/$query');
    List<dynamic> tags = json.decode(response.body);
    return tags.map((tag) => _parseTag(tag as Map<String, dynamic>)).toList();
  }

  static Future<void> comment(String placeID, String comment, List<Tag> tags) async {
    await doPost('v1/place/$placeID/comment', {
      'content': comment,
      'tags': tags.map((tag) => tag.id).toList()
    });
  }

  static Place _parsePlace(Map<String, dynamic> map) {
    List<dynamic> commentsRaw = map['comments'] as List<dynamic>;
    List<Comment> comments = commentsRaw.map((c) {
      Map<String, dynamic> map = c as Map;
      List<dynamic> tagsRaw = map['tags'];
      List<Tag> tags = tagsRaw.map((tag) => _parseTag(tag as Map<String, dynamic>)).toList();
      return Comment(map['content'], tags);
    }).toList();
    return Place(map['placeId'], map['name'], map['vicinity'], comments);
  }

  static Tag _parseTag(Map<String, dynamic> map) {
    return Tag(map['id'], map['label']);
  }
}