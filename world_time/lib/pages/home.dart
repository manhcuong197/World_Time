import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  String strDay;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data: ModalRoute.of(context).settings.arguments;
    print(data);
    strDay = (data['isDay']) ? 'day.jpg': 'night.jpg';

    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$strDay'),
                fit: BoxFit.cover,
              ),

            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: FlatButton.icon(
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(context, '/choose');
                            print(result);
                            setState(() {
                              data = {
                                'time':result['time'],
                                'location':result['location'],
                                'flag':result['flag'],
                                'isDay':result['isDay'],
                              };
                            });
                          },
                          icon: Icon(Icons.edit_location),
                          label: Text(' Edit Location', style: TextStyle(
                            color: Colors.amber,
                          ),)),
                    ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/${data['flag']}'),
                          ),
                        ),
                        SizedBox(height: 25.0,),
                        Text(
                          '${data['location']}',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.deepOrange
                          )),

                    SizedBox(height: 25.0,),
                    Text(
                        '${data['time']}',
                        style: TextStyle(
                          fontSize: 35.0,

                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}
