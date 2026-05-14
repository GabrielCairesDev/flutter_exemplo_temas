import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: context.theme.tertiaryColor);
  }
}
