import 'package:dakweather/screens/loading_page.dart';
import 'package:dakweather/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: kDefaultAppColor,
      statusBarColor: Colors.white70,
    ),
  );
  runApp(
    MaterialApp(
      title: 'dakWeather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: LoadingPage(),
    ),
  );
}
