import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourism_app_static/models/tourist_spot_model.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.infoContainerWidth,
    required this.infoContainerHeight,
    required this.touristSpot,
  });

  final double infoContainerWidth;
  final double infoContainerHeight;
  final TouristSpot touristSpot;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withAlpha(20),
            ),
            color: Colors.white.withAlpha(60),
            borderRadius: BorderRadius.circular(20),
          ),
          width: infoContainerWidth,
          height: infoContainerHeight,
          child: renderText(touristSpot.name, touristSpot.description),
        ),
      ),
    );
  }
}

Widget renderText(String name, String description) {
  return Padding(
    padding: EdgeInsets.all(30),
    child: Column(children: [
      SizedBox(height: 20),
      Text(
        name,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 40),
      Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    ]),
  );
}
