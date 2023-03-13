import 'package:clither/services/location.dart';
import 'package:clither/services/networking.dart';

const apiKey = '2efb5d717c918c7922150e19f16b51f9';
const mapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$mapURL?q=$cityName&appid=$apiKey&units=metric'
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$mapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'
    );
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherImage(int condition)
  {
    if (condition < 300) {
      return '1.9.jpg';
    } else if (condition < 400) {
      return '2.7.jpg';
    } else if (condition < 600) {
      return '2.7.jpg';
    } else if (condition < 700) {
      return '1.8.png';
    } else if (condition < 800) {
      return '2.1.jpg';
    } else if (condition == 800) {
      return '1.4.png';
    } else if (condition <= 804) {
      return '2.3.jpg';
    } else {
      return '2.2.jpg';
    }
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
