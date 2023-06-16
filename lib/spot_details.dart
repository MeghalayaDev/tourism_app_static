import 'package:flutter/material.dart';

class SpotDetails extends StatelessWidget {
  final String spotName, spotDesc, spotImage;
  const SpotDetails(
      {super.key,
      required this.spotName,
      required this.spotDesc,
      required this.spotImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Tourism App"),
          automaticallyImplyLeading: true, //code for back button
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).popUntil((route) {
                    return route.settings.name == "/";
                  }))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/images/$spotImage"),
          Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome to:',
                    textAlign: TextAlign.center,
                  ),
                  Text(spotName),
                  Text(spotDesc),
                ],
              )),
        ],
      ),
    );
  }
}
