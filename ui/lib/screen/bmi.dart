import 'package:fitness/utils/screen_util.dart';
import 'package:fitness/widget/chat_bubble.dart';
import 'package:flutter/material.dart';


class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? bmiResult;
  String? weightStatus;
  bool _aineed = false;

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = bmi;
        weightStatus = getWeightStatus(bmi);
      });
    }
  }

  String getWeightStatus(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi >= 18.5 && bmi <= 24.9) return "Perfect weight";
    return "Overweight";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: ScreenUtil.hight,
        width: ScreenUtil.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("lib/asset/images/pexels-scottwebb-28054.jpg"),
                fit: BoxFit.cover)),
        child: Stack(children: [
          _aineed
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 250, bottom: 60),
                    child: CustomPaint(
                      painter: ChatBubblePainter(),
                      child: Container(
                          height: 150,
                          width: 300,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            weightStatus == "Overweight"
                                ? 'You are overweight. Consider a balanced diet and regular exercise.'
                                : weightStatus == "Underweight"
                                    ? 'You are underweight. Focus on nutrient-rich meals and strength training.'
                                    : 'Your weight is normal. Keep up the healthy habits!',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenUtil.width / 3,
                  child: TextField(
                    style: const TextStyle(color: Colors.white60),
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: ScreenUtil.width / 3,
                  child: TextField(
                    style: const TextStyle(color: Colors.white60),
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white24,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculateBMI();
                      _aineed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                if (bmiResult != null)
                  Column(
                    children: [
                      Text(
                        'Your BMI: ${bmiResult!.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // Text(
                      //   'Result: $weightStatus',
                      //   style:
                      //       const TextStyle(fontSize: 20, color: Colors.white),
                      // ),
                    ],
                  ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
