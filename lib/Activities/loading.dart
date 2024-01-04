import 'package:flutter/material.dart';
import 'package:weather_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String latitude = "31.7584";
String longitude = "72.9165";
String temp = "null";
String hum = "null";
String air_speed = "null";
String desc = "null";
String main = "null";
String icon = "null";


  void startApp(String latitude,String longitude) async
  {
    worker instance = worker(latitude: latitude,longitude: longitude );
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speeed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/home', arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "airSpeed_value" : air_speed,
        "desc_value" : desc,
        "main_value" : main,
        "icon_value" : icon,
        "latitude_value" : latitude,
        "longitude_value" : longitude,
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? search = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    if (search?.isNotEmpty ?? false)
    {
      latitude = search?['searchText'] ;
      longitude = search?['searchText'] ;
    }
    startApp(latitude,longitude);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset("images/logo11.png", height: 200, width: 200,),
              // SizedBox(height: 45,),
              const Text("Weather", style: TextStyle(
                fontSize: 30,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),
              SizedBox(height: 10,),
              const Text("Made By Saqib", style: TextStyle(
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                  color: Colors.white
              ),),
          SizedBox(height: 30,),
          SpinKitWave(
            color: Colors.white,
            size: 40.0,
          ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[500],
    );
  }
}
