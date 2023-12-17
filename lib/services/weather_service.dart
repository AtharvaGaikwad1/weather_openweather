import 'dart:convert';

import 'package:weather_openweather/models/weather_model.dart';
import "package:http/http.dart" as http;


class WeatherService{

  static const base_url = "http://api.weatherapi.com/v1/current.json?key=73f05849d337477eb48202403231112&q=";
  final String api_key;

  WeatherService(this.api_key);
  
  Future<Weather> getWether(String cityName) async{
    final response = await http.get(Uri.parse(
      '$base_url$cityName&aqi=no'
    ));

    if(response.statusCode == 200){

      return Weather.fromJson(jsonDecode(response.body));
    }
    else{
      print(response.body);
      print(response.statusCode);
      throw Exception("Failed to load data");
      
    }

  }

  
}