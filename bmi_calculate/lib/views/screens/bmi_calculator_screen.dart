import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubit/bmi_calculator_cubit/bmi_calculator_cubit.dart';
import '../../controller/cubit/theme_cubit/theme_cubit.dart';
import '../../style/app_colors.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  late ThemeCubit cubit;
  late BmiCalculatorCubit bmiCalculatorCubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = ThemeCubit.get(context);
    bmiCalculatorCubit = BmiCalculatorCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const DefaultText(
                      text: 'BMI Calculator',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                            activeColor: AppTheme.grey,
                            thumbColor: cubit.isDark
                                ? AppTheme.white
                                : AppTheme.darkMood,
                            value: cubit.isDark,
                            onChanged: (value) {
                              cubit.changeTheme();
                            });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 174,
                        child: DefaultFormField(
                          controller: bmiCalculatorCubit.heightController,
                          validator: (value) {
                            return null;
                          },
                          hintText: 'Enter your height (m)',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 171,
                        child: DefaultFormField(
                          controller: bmiCalculatorCubit.widthController,
                          validator: (value) {
                            return null;
                          },
                          hintText: 'Enter your width (kg)',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                bmiCalculatorCubit.calculateBMI(
                                    bmiCalculatorCubit.heightController.text,
                                    bmiCalculatorCubit.widthController.text);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    cubit.isDark
                                        ? AppTheme.white
                                        : AppTheme.darkMood),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const DefaultText(
                                text: "Calculate",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                              child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: bmiCalculatorCubit.myColor,
                            ),
                            child: Center(
                              child: DefaultText(
                                text:
                                    "BMI : ${bmiCalculatorCubit.mainResult.text}",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color:
                                    cubit.isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          )),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const DefaultText(
                  text: 'Colors Catalog',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 23,
                ),
                const Divider(
                  thickness: 2,
                ),
                // SizedBox(
                //   height: 130,
                //   width: 500,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 7.5),
                //     child: ListView.separated(
                //       scrollDirection: Axis.horizontal,
                //       separatorBuilder: (context, index) => const VerticalDivider(
                //         width: 10,
                //         thickness: 2,
                //       ),
                //       itemCount: itemColorsCatalogModel.length,
                //       itemBuilder: (context, index) {
                //         return ColorsCatalogBuilder(
                //           colorsCatalogModel: itemColorsCatalogModel[index],
                //         );
                //       },
                //     ),
                //   ),
                // ),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 5,
                            color: cubit.isDark
                                ? AppTheme.white
                                : AppTheme.darkMood),
                        borderRadius: BorderRadius.circular(20),
                        color: bmiCalculatorCubit.myColor,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultText(
                  text: bmiCalculatorCubit.myColor == AppTheme.underweightColor
                      ? 'Underweight'
                      : bmiCalculatorCubit.myColor == AppTheme.normalColor
                          ? ' Normal'
                          : bmiCalculatorCubit.myColor ==
                                  AppTheme.overweightColor
                              ? 'Overweight'
                              : bmiCalculatorCubit.myColor ==
                                      AppTheme.obeseColor
                                  ? 'ObeseColor'
                                  : bmiCalculatorCubit.myColor ==
                                          AppTheme.extremeColor
                                      ? 'Extreme'
                                      : 'UnKnown',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

                const Divider(
                  thickness: 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
