
import 'dart:convert';

import 'package:http/http.dart';
import 'package:w27/data/metadata.dart';

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

  static Future<void> getPlaces(double lat, double lng) async {
    //Response response = await doGet('v1/place/$lat/$lng');
    //List<dynamic> places = json.decode(response.body);
    //print(places);
    //return metadata.map((d) => MetaData.fromMap(d)).toList();
    return [

    ];
  }

  static Future<List<MetaData>> getMetaData(String placeID) async {
    Response response = await doGet('v1/place/$placeID');
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> metadata = data['metadata'];
    return metadata.map((d) => MetaData.fromMap(d)).toList();
  }
}