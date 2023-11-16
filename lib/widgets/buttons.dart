import 'dart:ui';

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onInfoClick;

  const Buttons({super.key, required this.onInfoClick});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withAlpha(20),
            ),
            color: Colors.white.withAlpha(130),
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                  onPressed: onInfoClick,
                  icon: Icon(
                    Icons.info_outlined,
                    size: 29,
                    color: Colors.black.withAlpha(130),
                  ),
                ),
              ),
              Container(
                  width: 1, height: 20, color: Colors.black.withAlpha(100)),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 29,
                  color: Colors.black.withAlpha(130),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
