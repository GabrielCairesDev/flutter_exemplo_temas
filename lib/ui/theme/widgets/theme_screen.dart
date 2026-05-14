import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/ui/theme/widgets/theme_picker_list_widget.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.theme;

    return ScaffoldWidget(
      appBar: AppBarWidget(title: 'Selecionar Tema'),
      body: ThemePickerListWidget(
        themeLabels: viewModel.themes,
        selectedType: viewModel.currentType,
        onThemeSelected: viewModel.setTheme,
      ),
    );
  }
}
