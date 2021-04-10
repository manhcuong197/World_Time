
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await worldTime.getTime();
    print(worldTime.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': worldTime.location,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'isDay':worldTime.isDay,

    });
  }
  void initState(){
    super.initState();
    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            children: [
             SpinKitRing(
                  color: Colors.cyan,
                  size: 50.0,
                ),
              SizedBox(height: 15,),
              Text(
                'Loading',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
