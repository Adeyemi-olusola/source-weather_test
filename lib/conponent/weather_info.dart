import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app_test/utils/textstyles.dart';
import 'package:intl/intl.dart';

class WeatherInfo extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherInfo({required this.weatherData});

  IconData _getWeatherIcon(String description) {
    if (description.contains('rain')) {
      return WeatherIcons.rain;
    } else if (description.contains('cloud')) {
      return WeatherIcons.cloud;
    } else if (description.contains('sun')) {
      return WeatherIcons.day_sunny;
    } else {
      return WeatherIcons.day_sunny; // Default to sunny
    }
  }

  String _getWeatherImage(String description) {
    if (description.contains('light rain')) {
      return 'assets/images/icons8-partly-cloudy-day-48.png';
    } else if (description.contains('rain')) {
      return 'assets/images/icons8-rainfall.gif';
    } else if (description.contains('cloud')) {
      return 'assets/images/icons8-partly-cloudy-day-48.png';
    } else if (description.contains('sun')) {
      return 'assets/images/icons8-smiling-sun-48.png';
    } else {
      return 'assets/images/icons8-smiling-sun-48.png'; // Default to sunny
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                DateFormat('EEEE d/M/yyyy').format(DateTime.now()),
                style: AppTextStyles.bodyText,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Text('${weatherData['name']}', style: AppTextStyles.bodyText),
            // BoxedIcon(
            //   _getWeatherIcon(weatherData['weather'][0]['description']),
            //   size: 64,
            // ),

            Image.asset(
              _getWeatherImage(weatherData['weather'][0]['description']),
            ),
            Text(
              '${weatherData['main']['temp']} °C',
              style: AppTextStyles.bodyText.copyWith(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Condition:',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 13),
                ),
                Text(
                  '${weatherData['weather'][0]['description']}',
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
            Container(
              height: 40,
              width: 1,
              color: Colors.black,
            ),
            Column(
              children: [
                Text(
                  'Wind Speed:',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 13),
                ),
                Text(
                  '${weatherData['wind']['speed']}',
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
            Container(
              height: 40,
              width: 1,
              color: Colors.black,
            ),
            Column(
              children: [
                Text(
                  'Humidity:',
                  style: AppTextStyles.bodyText.copyWith(fontSize: 13),
                ),
                Text(
                  '${weatherData['main']['humidity']}%',
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
