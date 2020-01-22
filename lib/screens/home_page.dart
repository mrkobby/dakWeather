import 'package:dakweather/screens/search_city.dart';
import 'package:dakweather/services/weather_model.dart';
import 'package:dakweather/utilities/constants.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final callBackWeatherData;

  const HomePage({this.callBackWeatherData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weatherModel = new WeatherModel();

  var weatherDescription;
  var temperature;
  var cityName;
  Icon weatherIcon;
  ImageProvider weatherBackgroundImage;

  @override
  void initState() {
    super.initState();
    updateWeatherInfoFields(widget.callBackWeatherData);
  }

  void updateWeatherInfoFields(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = Icon(
            Icons.sync,
            size: 28.0,
            color: Colors.white70,
          );
          cityName = '';
          weatherBackgroundImage = AssetImage('assets/images/error_bg.png');
          return;
        } else {
          weatherDescription = weatherData['weather'][0]['description'];
          temperature = weatherData['main']['temp'];
          cityName = weatherData['name'];

          var weatherCondition = weatherData['weather'][0]['id'];
          weatherIcon = toggleWeatherIcon(weatherCondition);
          weatherBackgroundImage = toggleBacdgroundImage(weatherCondition);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: weatherBackgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                decoration: kTopContainerDecoration,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 15.0),
                          child: weatherIcon,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            '$temperature°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 80.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            cityName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            '"$weatherDescription"',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () async {
                  var searchedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchCity(),
                    ),
                  );
                  if (searchedCity != null) {
                    var weatherCityData =
                        await weatherModel.getPreciseCityWeather(searchedCity);
                    updateWeatherInfoFields(weatherCityData);
                  }
                },
                child: Hero(
                  tag: 'heroBottomContainer',
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDefaultAppColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 5),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
