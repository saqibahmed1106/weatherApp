import 'dart:convert';

import 'package:http/http.dart';

class worker
{
  var latitude;
  var longitude;
  // COnstructor :
  worker({this.latitude,this.longitude}){
    latitude = latitude;
    longitude = longitude;
  }

  String temp = "null";
  String humidity = "null";
  String air_speeed = "null";
  String description = "null";
  String main = "null";
  String icon = 'null';

//   Method :
    Future<void>  getData() async
  {
    try{
      String apiKey = "1aa9bca8dad968db5b5a654bd061eff1";


      String apiUrl =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";
      // Make the GET request
      Response response = await get(Uri.parse(apiUrl));
      Map data = jsonDecode(response.body);

      //   Getting Temp, humidity, air_speed :
      Map tempData = data['main'];
      Map wind = data['wind'];
      var getAirSpeed = wind['speed'] / 0.27777777777778;
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15 ;

      //   Getting Descrition :
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDesc = weatherMainData['description'];

      //   Assigning Values :
      temp = getTemp.toString(); // C
      humidity = getHumidity; // %
      air_speeed = getAirSpeed.toString(); // km/hr
      description = getDesc.toString();
      main = getMainDes.toString();
      icon = weatherMainData['icon'].toString();
    }catch(e)
    {
      temp = "NA";
      humidity = "NA";
      air_speeed = "NA";
      description = "NA";
      main = "NA";
      icon = "04n";
    }


  }
}
