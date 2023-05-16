import 'package:flutter/material.dart';
import 'package:flutter_setup/screens/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age = 34; // assigned integer
  double weight = 67.5; // assigned double value

  //assigning slider value
  double sliderValue = 100;
  double minValue = 20;
  double maxValue = 200;

  //to select gender

  bool gender = true;

  //calculate you bmi
  double? bmiResult;

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
              bmiResult = (weight / sliderValue / sliderValue) * 10000;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: bmiResult ?? 0.0,
                          )));

              // print(bmiResult);
            },
            child: Text(
              'Calulate your bmi'.toUpperCase(),
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
            },
            icon: const Icon(Icons.menu)),
        title: Text('Bmi Calculator'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 2.5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          color: Colors.blueGrey.shade900,
          child: Column(
            children: [
              //Gender Widget
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print('male selected');
                        setState(() {
                          gender = !gender;
                        });
                      },
                      child: Container(
                        height: 175,
                        width: 175,
                        color: Colors.grey.shade700,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color:
                                  gender == true ? Colors.white : Colors.grey,
                              size: 70,
                            ),
                            Text(
                              'male'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: gender == true
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        print('female selected');
                        setState(() {
                          gender = !gender;
                        });
                      },
                      child: Container(
                        height: 175,
                        width: 175,
                        color: Colors.grey.shade700,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color:
                                  gender == false ? Colors.white : Colors.grey,
                              size: 70,
                            ),
                            Text(
                              'female'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: gender == false
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Gender widget end//

              //Height widget
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade700,
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
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        })
                  ],
                ),
              ),

              //Height widget end...

              const SizedBox(
                height: 25,
              ),

              // Age and Weight widget
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    height: 175,
                    width: 175,
                    color: Colors.grey.shade700,
                    child: Column(
                      children: [
                        Text(
                          'Age'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
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
                                setState(() {
                                  age++;
                                });
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    height: 175,
                    width: 175,
                    color: Colors.grey.shade700,
                    child: Column(
                      children: [
                        Text(
                          'Weight'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$weight',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weight = weight - 1.25;
                                });
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight = weight + 1.25;
                                });
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
                  )
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              // const SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
