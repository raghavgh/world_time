

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String ? time; // the time in that location
  String flag; // url to an asset flag icon
  String endPoint; // location url for api endpoint
  bool ? isDayTime; // true or false if daytime or not

  WorldTime(
      {required this.location, required this.flag, required this.endPoint});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$endPoint'));
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(dateTime);
      print(offset);

      // create dateTime Obejct
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}


