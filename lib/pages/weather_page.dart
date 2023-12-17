import 'package:flutter/material.dart';
import 'package:weather_openweather/models/weather_model.dart';
import 'package:weather_openweather/services/weather_service.dart';

class WeatherOnlyPage extends StatefulWidget {
  const WeatherOnlyPage({super.key});

  @override
  State<WeatherOnlyPage> createState() => _WeatherOnlyPageState();
}

class _WeatherOnlyPageState extends State<WeatherOnlyPage> {


  final _weatherService = WeatherService('73f05849d337477eb48202403231112');
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Weather? _weather;

  

  _fetchWeather(String cityName) async{
    try{
      print("this is being EXECUTED");
      String city = nameController.text  ;
      final weather = await _weatherService.getWether(cityName);
      setState(() {
        _weather = weather;
      });
    }

    catch(e){
      print(e);
    }
  }


  




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      body: Center(
      
        child: Column(
          
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 130),
             RichText(
              text: TextSpan(
                text: 'Weather App 🌡️ ',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 40
                )
                // style: DefaultTextStyle.of(context).style,
                // children: const <TextSpan>[
                //   TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                //   TextSpan(text: ' world!'),
                // ],
              ),
              
            ),

            SizedBox(height: 30,),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter you City Name',
                ),
              ),
            ),

            ElevatedButton(onPressed:() {
              print("f");
              String new_city = nameController.text;
              _fetchWeather(new_city);

            }, 
            child: Text("Submit")),


            SizedBox(height: 120),

            Text(_weather?.cityName ?? "Loading" , style: TextStyle(fontSize: 35),),
            Text(_weather?.StateName ?? "Loading", style: TextStyle(fontSize: 35)),
            // Text(_weather?.WindSpeed ?? "Loading"),
            Text(_weather?.CurrentTemp ?? "Loading", style: TextStyle(fontSize: 35)),
            // Text('https:' _weather?.condition_Image ?? "LoOading"),

            Container(

              child:Image.network('https:${_weather?.condition_Image.toString()}'),
            )

          ],
        ),
      ),
    );
  }
}