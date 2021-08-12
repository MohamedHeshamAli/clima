import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '4e2a74106ae26d129e28abe0076efa43';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String URL = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetwokHelper netwokHelper = NetwokHelper(URL);
    var weatherData = await netwokHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetwokHelper netwokHelper = NetwokHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtude}&appid=$apiKey&units=metric');
    var weatherData = await netwokHelper.getData();
    return weatherData;
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
