import 'package:dakweather/services/api_connection_model.dart';
import 'package:dakweather/services/current_location_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

ImageProvider toggleBacdgroundImage(int condition) {
  if (condition < 600) {
    return AssetImage('assets/images/rainny_day.png');
  } else if (condition < 700) {
    return AssetImage('assets/images/snowy_day.png');
  }else if (condition < 800) {
    return AssetImage('assets/images/ordinary_day.png');
  } else {
    return AssetImage('assets/images/sunny_day.png');
  }
}

Icon toggleWeatherIcon(int condition) {
  if (condition < 300) {
    return Icon(WeatherIcons.thunderstorm, size: 40.0, color: Colors.white70,);
  } else if (condition < 400) {
    return Icon(WeatherIcons.raindrops, size: 40.0, color: Colors.white70,);
  } else if (condition < 600) {
    return Icon(WeatherIcons.rain, size: 40.0, color: Colors.white70,);
  } else if (condition < 700) {
    return Icon(WeatherIcons.snow, size: 40.0, color: Colors.white70,);
  }else if (condition < 800) {
    return Icon(WeatherIcons.fog, size: 40.0, color: Colors.white70,);
  } else if (condition == 800) {
    return Icon(WeatherIcons.day_sunny, size: 40.0, color: Colors.white70,);
  } else {
    return Icon(WeatherIcons.cloud, size: 40.0, color: Colors.white70,);
  }
}

const String apiKey = '5c40613a07ea6851dd63a2ee3ab8b314';
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getPreciseCityWeather(String preciseCityName) async {
    var url =
        '$openWeatherMapURL?q=$preciseCityName&units=metric&appid=$apiKey';

    ApiConnectionModel apiConnectionModelForPreciseCity =
        ApiConnectionModel(url);

    var weatherCityData =
        await apiConnectionModelForPreciseCity.getWeatherData();
    return weatherCityData;
  }

  Future<dynamic> getPreciseLocationWeatherInfo() async {
    CurrrentLocationModel currentLocation = new CurrrentLocationModel();
    await currentLocation.getCurrentLocation();

    ApiConnectionModel apiConnectionModel = ApiConnectionModel(
        '$openWeatherMapURL?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&units=metric&appid=$apiKey');

    var weatherData = await apiConnectionModel.getWeatherData();

    return weatherData;
  }
}
