import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult});

  final double bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Re-Calulate your bmi'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        leading: IconButton(
            onPressed: () {
              print('onPressed');
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white,
            )),
        title: Text(' Result Page'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 2.5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
        width: double.infinity,
        color: Colors.blueGrey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    bmiResult < 18.5
                        ? 'Underweight'.toUpperCase()
                        : bmiResult > 18.5 && bmiResult < 24.9
                            ? 'Normal'.toUpperCase()
                            : bmiResult > 25 && bmiResult < 29.9
                                ? 'Overweight'.toUpperCase()
                                : 'Obesity'.toUpperCase(),
                    style: TextStyle(
                        color: bmiResult < 18.5
                            ? Colors.blue
                            : bmiResult > 18.5 && bmiResult < 24.9
                                ? Colors.lightGreen
                                : bmiResult > 25 && bmiResult < 29.9
                                    ? Colors.red.shade300
                                    : Colors.red.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    bmiResult.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 68,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    bmiResult < 18.5
                        ? 'Underweight BMI Range'.toUpperCase()
                        : bmiResult > 18.5 && bmiResult < 24.9
                            ? 'Normal BMI Range'.toUpperCase()
                            : bmiResult > 25 && bmiResult < 29.9
                                ? 'Overweight BMI Range'.toUpperCase()
                                : 'Obesity BMI Range'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${bmiResult < 18.5 ? '< 18.5' : bmiResult > 18.5 && bmiResult < 24.9 ? '18.5 - 24.9' : bmiResult > 25 && bmiResult < 29.9 ? '25 - 29.9' : '30>'} kg/m2',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .25),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    bmiResult < 18.5
                        ? 'You are underweight.\n Please eat much'
                        : bmiResult > 18.5 && bmiResult < 24.9
                            ? 'You are perfectly normal . \n Good jon !!'
                            : bmiResult > 25 && bmiResult < 29.9
                                ? 'You are overweight . \n Go to diet !!'
                                : 'You are increasingly overweight. \n Go to diet soon !!',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800),
                      onPressed: () {},
                      child: const Text(
                        'Save Result',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
