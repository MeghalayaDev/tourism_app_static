import 'package:flutter/material.dart';

class SpotDetails extends StatelessWidget {
  final String spotName;
  const SpotDetails({super.key, required this.spotName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Tourism App"),
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
          const Text(
            'Welcome to our second Page!',
            textAlign: TextAlign.center,
          ),
          Text(spotName),
        ],
      ),
    );
  }
}
