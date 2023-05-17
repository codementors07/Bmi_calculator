import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgeAndWeightWidget extends StatelessWidget {
  AgeAndWeightWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.onTap1,
      required this.onTap2});

  final String title;
  dynamic value;
  final Function onTap1;
  final Function onTap2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 175,
      width: 175,
      color: const Color(0xff1d2033),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 48, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  onTap1.call();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              //on tap property accessible garaucha
              InkWell(
                onTap: () {
                  onTap2.call();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
