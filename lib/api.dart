
import 'dart:convert';

import 'package:http/http.dart';
import 'package:w27/data/comment.dart';
import 'package:w27/data/place.dart';

class API {
  static const String URL = 'https://w27-wvs.alexdev.de/';
  
  static Future<Response> doGet(String route) {
    return get('$URL/$route');
  }

  static Future<Response> doPut(String route, Map<String, dynamic> data) {

    var body = json.encode(data);
    
    return put(
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
}]
  """;

  static Future<List<Place>> getPlaces(double lat, double lng) async {
    //Response response = await doGet('v1/place/$lat/$lng');
    //List<dynamic> places = json.decode(response.body);
    List<dynamic> places = json.decode(test);
    print(places);
    return places.map((p) {
      Map<String, dynamic> map = p as Map;
      List<dynamic> commentsRaw = map['comments'] as List<dynamic>;
      List<Comment> comments = commentsRaw.map((c) {
        Map<String, dynamic> map = c as Map;
        List<dynamic> tagsRaw = map['tags'];
        print('RAW: $tagsRaw');
        List<String> tags = tagsRaw.map((t) => t as String).toList();
        return Comment(map['content'], tags);
      }).toList();
      return Place(map['name'], map['vicinity'], comments);
    }).toList();
  }
}