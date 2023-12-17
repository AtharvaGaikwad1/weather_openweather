import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final String StateName;
  final String WindSpeed;
  final String condition_Image;
  final String CurrentTemp;

  Weather({ required this.cityName,
  required this.StateName,
  required this.WindSpeed,
  required this.condition_Image,
  required this.CurrentTemp
  
  });

  factory Weather.fromJson(Map<String,dynamic> json){
    return Weather(
      
      cityName: json['location']['name'],
      StateName: json['location']['region'], 
      WindSpeed: json['current']['condition']['wind_kph'].toString(),
      CurrentTemp: json['current']['temp_c'].toString(),
      condition_Image: json['current']['condition']['icon']
    // WindSpeed: WindSpeed, 
    // condition_Image: condition_Image, 
    // CurrentTemp: CurrentTemp)
    );
  }


}