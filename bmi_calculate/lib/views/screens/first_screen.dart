import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../style/app_colors.dart';
import '../widgets/default_text.dart';
import 'bmi_calculator_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  text: 'Warning: ',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.amber,
                ),
                DefaultText(
                  text: 'children under 19 years old,',
                  fontSize: 20,
                ),
              ],
            ),
            const DefaultText(
              text: 'pregnant women, are excluded from this',
              fontSize: 20,
            ),
            const DefaultText(
              text: 'calculation.',
              fontSize: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const BmiCalculatorScreen(),
                                type: PageTransitionType.size,
                                alignment: Alignment.bottomCenter,
                                duration: const Duration(seconds: 1)));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.darkMood),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const DefaultText(
                        text: "List Start",
                        fontSize: 20,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
