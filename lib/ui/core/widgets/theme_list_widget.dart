import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/icon_widget.dart';

class ThemeListTileWidget extends StatelessWidget {
  const ThemeListTileWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextStyle(color: context.theme.textColor)),
      trailing: selected ? IconWidget(icon: Icons.check) : null,
      onTap: onTap,
      enabled: onTap != null,
    );
  }
}
