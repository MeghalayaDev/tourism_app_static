import 'package:flutter/material.dart';
import 'package:tourism_app_static/models/tourist_spot_model.dart';
import 'package:tourism_app_static/pages/spot_details.dart';


class LocationAnimatedContainer extends StatelessWidget {
  final bool active;
  final TouristSpot tourisSpot;
  const LocationAnimatedContainer({
    super.key,
    required this.active,
    required this.tourisSpot,
  });

  @override
  Widget build(BuildContext context) {
    final double top = active ? 100 : 200;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpotDetails(
              touristSpot: tourisSpot,
            ),
          ),
        );
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: EdgeInsets.only(top: top, bottom: 50, right: 20),
          curve: Curves.easeOutQuint,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  tourisSpot.imageSrc,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: renderText(tourisSpot.name, tourisSpot.location),
                ),
              ],
            ),
          )),
    );
  }
}

Widget renderText(String name, String location) {
  return Container(
    width: double.infinity,
    height: 120,
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: const [0.2, 1],
        colors: [
          Colors.black.withAlpha(200),
          Colors.black.withAlpha(10),
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          location,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    ),
  );
}
