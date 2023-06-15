import 'package:flutter/material.dart';

class ListOfTouristSpots extends StatelessWidget {
  const ListOfTouristSpots({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.wb_sunny),
            iconColor: Colors.amber,
            title: Text(
              'Sweet Falls',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle:
                const Text('This is a waterfall in the city of Meghalaya'),
            onTap: () => print("Sweet Falls Pressed"),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.brightness_3),
            title: Text(
              'Laitlum Canyon',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle:
                const Text('A small yet breath taking canyon in Meghalaya'),
            onTap: () => print("Laitlum Canyon Pressed"),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.star),
            iconColor: Colors.blue,
            title: Text(
              'Mawsmai Cave',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: const Text('A cave in Sohra'),
            onTap: () => print("Mawsmai Cave Pressed"),
          ),
        ),
      ],
    );
  }
}
