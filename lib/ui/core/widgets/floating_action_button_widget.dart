import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, this.onPressed, this.child});

  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.theme.secondaryColor,
      child: child,
    );
  }
}
