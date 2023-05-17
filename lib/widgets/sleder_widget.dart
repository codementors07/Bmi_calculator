import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget(
      {super.key,
      required this.sliderValue,
      required this.minValue,
      required this.maxValue,
      required this.onChanged});

  final double sliderValue;
  final double minValue;
  final double maxValue;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color(0xff1d2033),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text(
            'height'.toUpperCase(),
            style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: .75),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: sliderValue.toStringAsFixed(2),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 54,
                    fontWeight: FontWeight.bold)),
            const TextSpan(
              text: '  ',
            ),
            TextSpan(
                text: 'cm',
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ])),
          const SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: Colors.white,
              thumbColor: Colors.pink,
              // divisions: 10,
              // label: 'ahhaha',
              value: sliderValue,
              min: minValue,
              max: maxValue,
              onChanged: onChanged)
        ],
      ),
    );
  }
}
