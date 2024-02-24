import 'package:calculate_bmi/views/model/colors_catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/theme_cubit/theme_cubit.dart';
import '../../style/app_colors.dart';
import '../widgets/default_text.dart';

class ColorsCatalogBuilder extends StatefulWidget {
  final ColorsCatalogModel colorsCatalogModel;
  const ColorsCatalogBuilder({super.key, required this.colorsCatalogModel});

  @override
  State<ColorsCatalogBuilder> createState() => _ColorsCatalogBuilderState();
}

class _ColorsCatalogBuilderState extends State<ColorsCatalogBuilder> {
  late ThemeCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit = ThemeCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: cubit.isDark ? AppTheme.white : AppTheme.darkMood),
                  borderRadius: BorderRadius.circular(20),
                  color: widget.colorsCatalogModel.colors),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultText(
          text: widget.colorsCatalogModel.text,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
