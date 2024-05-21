import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  AlignmentGeometry _alignment = Alignment.topRight;
  AlignmentGeometry _geometry = Alignment.bottomLeft;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
      _geometry = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/angryback.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _alignment,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/images/redbird.png',
                height: 75,
                width: 75,
              ),
            ),
            AnimatedAlign(
              alignment: _geometry,
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/images/greenpig.png',
                height: 75,
                width: 75,
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () => _changeAlignment(),
                child: const Text('START'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
