import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Container(
                width: 64,
                height: 64,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
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
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
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
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 80,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
