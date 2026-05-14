import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.primaryColor,
      iconTheme: IconThemeData(color: context.theme.textColor),
      title: Text(title, style: TextStyle(color: context.theme.textColor)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
