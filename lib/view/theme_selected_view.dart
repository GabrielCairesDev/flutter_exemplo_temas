import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/widgets/text_widget.dart';

class ThemeSelectedView extends StatelessWidget {
  const ThemeSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBarWidget(title: 'Tema selecionado'),
      body: Column(
        children: [
          Expanded(child: Container(color: context.theme.primaryColor)),
          Expanded(
            child: Container(
              width: double.infinity,
              color: context.theme.secondaryColor,
              child: Column(
                children: [
                  TextWidget(text: context.theme.emoji, fontSize: 100),
                  TextWidget(text: context.theme.name, fontSize: 50),
                ],
              ),
            ),
          ),
          Expanded(child: Container(color: context.theme.tertiaryColor)),
        ],
      ),
    );
  }
}
