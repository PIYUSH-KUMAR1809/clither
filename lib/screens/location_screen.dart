import 'package:clither/screens/city_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clither/utilities/constants.dart';
import 'package:clither/services/weather.dart';


class LocationScreen extends StatefulWidget {

  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;
  const LocationScreen({required this.locationWeather, super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  late String imageName;
  late double tempmin;
  late double tempmax;
  late double feelslike;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print(widget.locationWeather);
    }
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData)
  {
    setState((){
      if(weatherData == null)
        {
          temperature = 0;
          tempmin = 0;
          tempmax = 0;
          feelslike = 0;
          cityName = 'Error';
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          return;
        }
    double temp = weatherData['main']['temp'];
    tempmin = weatherData['main']['temp_min'];
    tempmax = weatherData['main']['temp_max'];
    feelslike = weatherData['main']['feels_like'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    weatherMessage = weatherModel.getMessage(temperature);
    cityName = weatherData['name'];
    if (kDebugMode) {
      print(temperature);
    }
    if (kDebugMode) {
      print(condition);
    }
    if (kDebugMode) {
      print(cityName);
    }
    if (kDebugMode) {
      print(tempmax);
    }
    if (kDebugMode) {
      print(tempmin);
    }
    if (kDebugMode) {
      print(feelslike);
    }
    imageName = weatherModel.getWeatherImage(condition);
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$imageName'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weatherModel.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typedName = await Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context){
                          return const CityScreen();
                        },
                        ),
                        );
                        if (kDebugMode) {
                          print(typedName);
                        }
                        if(typedName != null)
                        {
                          var weatherData = await weatherModel.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('City Name : $cityName',
                          style: kTempTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Temperature : $temperature',
                            style: kTempTextStyle,
                          ),
                          Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Max Temp : $tempmax',
                          style: kTempTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Min Temp : $tempmin',
                          style: kTempTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Feels like : $feelslike',
                          style: kTempTextStyle,
                          ),
                        ],
                      )
                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    '$weatherMessage in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
