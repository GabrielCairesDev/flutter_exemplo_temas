import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/icon_widget.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IconWidget(icon: icon),
      onPressed: onPressed,
      color: context.theme.secondaryColor,
    );
  }
}
