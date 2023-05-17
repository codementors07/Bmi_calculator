import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {super.key,
      required this.gender,
      required this.genderName,
      required this.icon,
      required this.textColor,
      required this.iconColors});

  final bool gender;
  final String genderName;
  final IconData icon;
  final Color
      iconColors; // runtime ma value access garaucha and those parameters jasko value chai change hudaina until runtime
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      color: const Color(0xff1d2033),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColors,
            size: 70,
          ),
          Text(
            genderName.toUpperCase(),
            style: TextStyle(
                fontSize: 20, color: textColor, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
