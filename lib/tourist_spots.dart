import 'package:flutter/material.dart';
import 'package:tourism_app_static/spot_details.dart';

class ListOfTouristSpots extends StatelessWidget {
  const ListOfTouristSpots({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      "Sweet Falls",
      "Mawsmai Cave",
      "Laitlum Canyon"
    ];

    final List<String> shortDesc = [
      "This is a waterfall in the city of Meghalaya.",
      "A cave in Sohra",
      "A small yet breath taking canyon in Meghalaya"
    ];

    final List<String> spotImage = [
      "sweetfalls.webp",
      "mawsmaicave.jpeg",
      "laitlumcanyon.webp",
    ];

    return ListView.builder(
      itemCount: 3, // the length
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/images/${spotImage[index]}"),
                  ListTile(
                    title: Text(names[index]),
                    subtitle: Text(shortDesc[index]),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext) => SpotDetails(
                      spotName: names[index],
                      spotDesc: shortDesc[index],
                      spotImage: spotImage[index],
                    ))),
          ),
        );
      },
    );
  }
}
