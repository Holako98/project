// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation/battery.dart';
import 'package:graduation/dioHelper.dart';
import 'package:graduation/ui/background/background.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class home extends StatefulWidget {

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double percent = 1;
  var indicator = 100;
  var totalPower  = '';
  var DeviceTemp = {
    'temp':'',
    'power':'',
  };

  var batteryOne = '';
  var battery=0;

  Future fetchPanelOData() async {

    var response= await DioHelper.getHttp(endPoint: 'screen/1');
    print('Response from screen 1 widget');
    print(response);
    setState(() {
      totalPower = response['power'].toString();
      DeviceTemp = {
        'temp':response['solarPanel']['temp'].toString(),
        'power':response['solarPanel']['power'].toString(),
      };
      batteryOne = response['battery'].toString();
      battery = response['battery'];
    });
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to this class

    fetchPanelOData();

  }

  @override
  Widget build(BuildContext context) {

    // DioHelper.getHttp(endPoint: 'screen/1');

    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                //FIXED PADDING => CENTER WIDGET
                top: 100.0,
                right: 25.0,
                left: 25.0,
                bottom: 30.0,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Welcome Azzam,',
                      style: TextStyle(
                        color: Color(0xff0072e5),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Column(
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          radius: 70,
                          lineWidth: 10,
                          percent: percent,
                          linearGradient:LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.2, 0.6, 0.8],
                            colors: [
                              Color(0xfffffb07),
                              Color(0xfffd1d1d),
                              Color(0xff0072e5),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Container(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Column(
                              children: [
                                Text('$indicator',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0072e5),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text('Watt',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff0072e5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Total Power',
                          style: TextStyle(
                            color: Color(0xFF4A87E2),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Text('Estimated Time',
                                    style: TextStyle(
                                      color: Color(0xff0072e5),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('2 hr, 45 min',
                                    style: TextStyle(
                                      color: Colors.blueAccent[200],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$batteryOne%',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4A87E2),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Battery(
                                    value: battery,
                                    size: 150,
                                  // activeColor: Color(0xFF4A87E2),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          Row(
                            children: [
                              Expanded(

                                child: Icon(
                                  Icons.thermostat,
                                  size: 40,
                                  color: Colors.redAccent[200],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${DeviceTemp['temp']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0072e5),
                                      ),
                                    ),
                                    Text(
                                      '°C',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
