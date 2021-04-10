import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDay;
  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{
    try{
      Response response = await  get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      Map data=jsonDecode(response.body);

      String dateTime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      DateTime now=DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay = (now.hour >= 0 && now.hour < 12) ? true : false;
      time=DateFormat.jm().format(now);


    }
    catch(e){
      print('error: $e');
      time='lost time data';
    }

  }
}