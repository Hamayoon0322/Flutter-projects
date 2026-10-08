import 'package:flutter/material.dart';

class ImageRoller extends StatefulWidget {
  const ImageRoller({super.key});
  @override
  State<ImageRoller> createState() {
    return _ImageRollerState();
  }
}

class _ImageRollerState extends State<ImageRoller> {
  var activePicnicImage = 'assets/images/image-1.jpg';

  void rollImage() {
    setState(() {
      activePicnicImage = 'assets/images/image-4.jpg';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activePicnicImage, width: 300),
        const SizedBox(height: 30),
        TextButton(
          onPressed: rollImage,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 25),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 32),
          ),
          child: const Text('Roll image'),
        ),
      ],
    );
  }
}
