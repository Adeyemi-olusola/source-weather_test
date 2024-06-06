import 'package:flutter/material.dart';

class WeatherInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  WeatherInputField({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSearch,
      decoration: InputDecoration(
        labelText: 'Enter city name',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            onSearch(controller.text);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
