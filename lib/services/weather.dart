import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '2b93c20787c0d1d0a547c64983f1f9fc';
const weatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getcityWeather(String cityName) async {
    NetworkHelper helper =
        NetworkHelper('$weatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await helper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location L = Location();
    await L.getCurrentLocation();
    NetworkHelper helper = NetworkHelper(
        '$weatherMapUrl?lat=${L.latitude}&lon=${L.longitude}&appid=$apiKey&units=metric');
    var weatherData = await helper.getData();
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
