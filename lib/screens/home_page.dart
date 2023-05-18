import 'package:flutter/material.dart';
import 'package:flutter_setup/screens/result_page.dart';

import '../widgets/age_and_weight.dart';
import '../widgets/gender_widget.dart';
import '../widgets/sleder_widget.dart';
import 'widget_practice.dart';

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

  // #0a0c23 background color
  // #8d8d99 icon color
  // #1c2033 icon background cpolor
  // #1d2033 container backgroud color

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
        backgroundColor: const Color(0xff0a0c23),
        leading: IconButton(
            onPressed: () {
              print('onPressed');
            },
            icon: const Icon(Icons.menu)),
        title: Text('Bmi Calculator'.toUpperCase()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyWidget()));
              },
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 34,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 2.5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          color: const Color(0xff0a0c23),
          child: Column(
            children: [
              //Gender Widget
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //male container
                    InkWell(
                      onTap: () {
                        setState(() {
                          gender = !gender;
                        });
                      },
                      child: GenderWidget(
                        gender: gender,
                        genderName: 'Male',
                        icon: Icons.male,
                        iconColors: gender == true ? Colors.white : Colors.grey,
                        textColor: gender == true ? Colors.white : Colors.grey,
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    //female container
                    InkWell(
                      onTap: () {
                        setState(() {
                          gender = !gender;
                        });
                      },
                      child: GenderWidget(
                        gender: gender,
                        genderName: 'Female',
                        icon: Icons.female,
                        iconColors:
                            gender == false ? Colors.white : Colors.grey,
                        textColor: gender == false ? Colors.white : Colors.grey,
                      ),
                    ),

                    //DRY (don't repeat yourself)
                  ],
                ),
              ),

              //Gender widget end//

              //Height widget

              SliderWidget(
                sliderValue: sliderValue,
                minValue: minValue,
                maxValue: maxValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),

              //Height widget end...

              const SizedBox(
                height: 25,
              ),

              // Age and Weight widget
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AgeAndWeightWidget(
                        title: 'Age',
                        value: age,
                        onTap1: () {
                          setState(() {
                            age--;
                          });
                        },
                        onTap2: () {
                          setState(() {
                            age++;
                          });
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AgeAndWeightWidget(
                        title: 'Weight',
                        value: weight,
                        onTap1: () {
                          setState(() {
                            weight = weight - 1.25;
                          });
                        },
                        onTap2: () {
                          setState(() {
                            weight = weight + 1.25;
                          });
                        }),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
