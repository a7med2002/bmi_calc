import 'package:bmi_calc/helper/constant.dart';
import 'package:bmi_calc/logic/bmi_model.dart';
import 'package:bmi_calc/screens/result.dart';
import 'package:bmi_calc/widgets/custom_calc_button.dart';
import 'package:bmi_calc/widgets/custom_card.dart';
import 'package:bmi_calc/widgets/custom_counter_button.dart';
import 'package:bmi_calc/widgets/custom_gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum Gender { Male, FEMALE }

class _HomeState extends State<Home> {
  int height = 150;
  int weight = 45;
  int age = 17;
  Gender selectedGender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Color(0xff24263B),
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender
          Expanded(
            child: Row(
              children: [
                // Male
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedGender = Gender.Male;
                      setState(() {});
                    },
                    child: CustomCard(
                      cardColor: selectedGender == Gender.Male
                          ? secondaryColor
                          : backgroundCard,
                      child: CustomGender(
                        gender: "Male",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                // Female
                Expanded(
                  child: InkWell(
                    onTap: () {
                      selectedGender = Gender.FEMALE;
                      setState(() {});
                    },
                    child: CustomCard(
                      cardColor: selectedGender == Gender.FEMALE
                          ? secondaryColor
                          : backgroundCard,
                      child: CustomGender(
                        gender: "Female",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Height
          Expanded(
            child: CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Height", style: labelStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${height.ceil()}",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      activeTrackColor: secondaryColor,
                      inactiveTrackColor: primaryColor,
                      thumbColor: secondaryColor,
                    ),
                    child: Slider(
                      max: 220,
                      min: 100,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {});
                        height = value.toInt();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Weight & Age
          Expanded(
            child: Row(
              children: [
                // Weight
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Weight", style: labelStyle),
                        Text(
                          "$weight",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomCounterButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  if (weight > 40) --weight;
                                });
                              },
                            ),
                            CustomCounterButton(
                              icon: FontAwesomeIcons.add,
                              onTap: () {
                                setState(() {
                                  if (weight < 200) ++weight;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Age
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Age", style: labelStyle),
                        Text(
                          "$age",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomCounterButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(() {
                                  if (age > 17) --age;
                                });
                              },
                            ),
                            CustomCounterButton(
                              icon: FontAwesomeIcons.add,
                              onTap: () {
                                setState(() {
                                  if (age < 80) ++age;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calc Button
          CustomCalcButton(
            title: "Calculate",
            onTap: () {
              BmiModel bmiCalc = BmiModel(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: bmiCalc.calcBmi(),
                    advice: bmiCalc.getAdvice(),
                    result: bmiCalc.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
