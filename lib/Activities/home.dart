import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("this is init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("this is set state");
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic>? info = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    String temp = ((info?['temp_value']).toString()).substring(0,4);
    String air_speed = ((info?['airSpeed_value']).toString()).substring(0,4);
    if(temp == "NA")
      {
        print("NA");
      }else{
      String temp = ((info?['temp_value']).toString()).substring(0,4);
      String air_speed = ((info?['airSpeed_value']).toString()).substring(0,4);
      }
    String icon = info?['icon_value'];
    String latitude = info?['latitude_value'];
    String longitude = info?['longitude_value'];
    String hum = info?['hum_value'];
    String desc = info?['desc_value'];
    print (icon);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue.shade800, Colors.blue.shade300])),
            child: Column(
              children: [
                Container(
                  // Search wala container
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                    GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == "")
                            {
                              print("Blank Search");
                            }else{
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText" : searchController.text,
                            });
                          }
                            },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: " Search City latitude,longitude",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text("$desc",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),),
                                // Text("$latitude",style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold),),
                                // Text("$longitude",style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp", style: TextStyle(
                                  fontSize: 70
                                ),),
                                Text("C", style: TextStyle(
                                  fontSize: 30
                                ),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Text("$air_speed", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                            ),),
                            Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Text("$hum", style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                            Text("Percent")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text("Made By Saqib",
                          style: TextStyle(fontFamily: "Roboto")),
                      Text("Data Provided By Openweathermap.org",
                          style: TextStyle(fontFamily: "Roboto"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
