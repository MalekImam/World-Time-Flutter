import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or nighttime

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    try{
      print(url);
      Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(res.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time and daytime property
      this.isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now);
    }
    catch(err){
      print('Caught error: $err');
      time = 'Could not get time data';
    }
  }
}