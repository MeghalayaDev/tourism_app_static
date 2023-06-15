import 'package:flutter/material.dart';

class ListOfTouristSpots extends StatelessWidget {
  const ListOfTouristSpots({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(8.0),
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Icon(Icons.sunny),
              Text(
                "Sweet Falls, Meghalaya",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text(
                "This waterfall is in the capital city of Meghalaya, it is a beautiful waterfall",
                textAlign: TextAlign.center,
              )
            ]),
          ),
        )
      ],
    );
  }
}
