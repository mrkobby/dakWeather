import 'package:dakweather/screens/home_page.dart';
import 'package:dakweather/services/weather_model.dart';
import 'package:dakweather/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    getPreciseLocationWeatherData();
  }

  void getPreciseLocationWeatherData() async {
    var weatherData = await WeatherModel().getPreciseLocationWeatherInfo();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          callBackWeatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultAppColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/logo_white.png'),
          ),
          SizedBox(
            height: 20.0,
          ),
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('Getting current location..', style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
