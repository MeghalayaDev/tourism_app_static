import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourism_app_static/models/tourist_spot_model.dart';

import 'package:tourism_app_static/widgets/location_animated_container.dart';

final List<Map<String, String>> touristSpotsList = [
  {
    "name": "Sweet Falls",
    "location": "Shillong",
    "description":
        "Sweet Falls is a waterfall in Shillong. It lies about 5 km from Happy Valley and is about 96 metres in height. It is often termed as the most beautiful yet most dangerous waterfall in Shillong. The destination is accessible via road",
    "imageSrc": "assets/images/sweetfalls.webp",
  },
  {
    "name": "Mawsmai Cave",
    "location": "Sohra",
    "description": "A cave in Sohra",
    "imageSrc": "assets/images/mawsmaicave.jpeg",
  },
  {
    "name": "Laitlum Canyon",
    "location": "laitum",
    "description":
        "One of the most amazing and picturesque tourist destinations, perched atop the East Khasi Hills of Shillong is The Laitlum Canyons, which in literal sense means “The End of Hills” or “The End of The World”. Nestled in the embrace of majestic hills and valleys, The Laitlum Canyons in one such spot from where the vast, verdant and fascinating panorama of Meghalaya could be viewed and admired.Located at just 45 min drive from the center of Meghalaya’s capital Shillong, this exotic site is relatively less crowded and less commercial, thus offering a serene, secluded spot for some quiet, peaceful moments.  ",
    "imageSrc": "assets/images/laitlumcanyon.webp",
  }
];

class ListOfTouristSpots extends StatefulWidget {
  const ListOfTouristSpots({super.key});

  @override
  State<ListOfTouristSpots> createState() => _ListOfTouristSpotsState();
}

class _ListOfTouristSpotsState extends State<ListOfTouristSpots> {
  List<TouristSpot> tourisSpots = touristSpotsList.map((item) {
    final String name = item['name']!;
    final String description = item['description']!;
    final String imageSrc = item['imageSrc']!;
    final String location = item['location']!;
    return TouristSpot(
        name: name,
        description: description,
        imageSrc: imageSrc,
        location: location);
  }).toList();

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int next = _pageController.page?.round() ?? 0;
      if (next != currentPage) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: tourisSpots.length,
        itemBuilder: _buildTouristSpotCard,
      ),
    );
  }

  Widget _buildTouristSpotCard(BuildContext context, index) {
    final touristSpot = tourisSpots[index];
    bool active = index == currentPage;

    return LocationAnimatedContainer(
      active: active,
      tourisSpot: touristSpot,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
