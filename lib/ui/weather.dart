import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:weather_app_test/conponent/shimmer.dart';
import 'package:weather_app_test/conponent/weather_info.dart';
import 'package:weather_app_test/conponent/weather_input_field.dart';
import 'package:weather_app_test/service/weather_service.dart';
import 'package:weather_app_test/utils/textstyles.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _controller = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String? _city;
  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;
  String _backgroundImage = 'assets/sunny.jpg'; // Default background

  void _fetchWeather({bool isRefresh = false}) async {
    if (_city == null || _city!.isEmpty) return;
    if (!isRefresh) {
      setState(() {
        _isLoading = true;
      });
    }
    try {
      final data = await _weatherService.fetchWeather(_city!);
      setState(() {
        _weatherData = data;
        _backgroundImage =
            _getBackgroundImage(data['weather'][0]['description']);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load weather data')),
      );
    } finally {
      if (isRefresh) {
        _refreshController.refreshCompleted();
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getBackgroundImage(String description) {
    if (description.contains('rain')) {
      return 'assets/rainy.jpg';
    } else if (description.contains('cloud')) {
      return 'assets/cloudy.jpg';
    } else if (description.contains('sun')) {
      return 'assets/sunny.jpg';
    } else {
      return 'assets/sunny.jpg'; // Default to sunny
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: AppTextStyles.appBarTitle,
          ),
        ),
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: () => _fetchWeather(isRefresh: true),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    // //  image: AssetImage(_backgroundImage),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    WeatherInputField(
                      controller: _controller,
                      onSearch: (value) {
                        setState(() {
                          _city = value;
                        });
                        _fetchWeather();
                      },
                    ),
                    Expanded(
                      child: _isLoading
                          ? WeatherShimmer()
                          : _weatherData != null
                              ? WeatherInfo(weatherData: _weatherData!)
                              : Center(
                                  child: Text(
                                    'Enter a city to get weather',
                                    style: AppTextStyles.bodyText,
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
