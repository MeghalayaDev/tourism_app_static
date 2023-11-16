import 'package:flutter/material.dart';
import 'package:tourism_app_static/models/tourist_spot_model.dart';
import 'package:tourism_app_static/widgets/buttons.dart';
import 'package:tourism_app_static/widgets/description_container.dart';

class SpotDetails extends StatefulWidget {
  final TouristSpot touristSpot;
  const SpotDetails({super.key, required this.touristSpot});

  @override
  State<SpotDetails> createState() => _SpotDetailsState();
}

class _SpotDetailsState extends State<SpotDetails> {
  bool isInfoVisible = false;
  bool isButtonsVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeVisibility();
  }

  void _initializeVisibility() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        isInfoVisible = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isButtonsVisible = true;
      });
    });
  }

  void _toggleInfoVisiblity() {
    setState(() => isInfoVisible = !isInfoVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          _buildInfoContainer(context),
          _buildButtonsContainer()
        ],
      ),
    );
  }

  Widget _buildButtonsContainer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      bottom: isButtonsVisible ? 20 : -60,
      right: 30,
      curve: Curves.easeInOut,
      child: Buttons(
        onInfoClick: _toggleInfoVisiblity,
      ),
    );
  }

  Widget _buildInfoContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final infoContainerWidth = size.width * 0.85;
    final infoContainerHeight = size.height * 0.7;

    return AnimatedPositioned(
      left: isInfoVisible ? (size.width - infoContainerWidth) / 2 : -size.width,
      top: (size.height - infoContainerHeight) / 2,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 600),
      child: DescriptionContainer(
        infoContainerWidth: infoContainerWidth,
        infoContainerHeight: infoContainerHeight,
        touristSpot: widget.touristSpot,
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      widget.touristSpot.imageSrc,
      fit: BoxFit.cover,
    );
  }
}

