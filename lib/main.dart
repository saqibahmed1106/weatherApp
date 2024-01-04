import 'package:flutter/material.dart';
import 'package:weather_app/Activities/home.dart';
import 'package:weather_app/Activities/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => const Loading(),
      "/home" : (context) => const Home(),
      "/loading" : (context) =>  Loading(),
    },
  ));
}
