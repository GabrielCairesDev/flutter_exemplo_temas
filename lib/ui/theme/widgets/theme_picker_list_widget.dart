import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_type.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/theme_list_widget.dart';

class ThemePickerListWidget extends StatelessWidget {
  const ThemePickerListWidget({
    super.key,
    required this.themeLabels,
    required this.selectedType,
    required this.onThemeSelected,
  });

  final Map<ThemeType, String> themeLabels;
  final ThemeType selectedType;
  final Future<void> Function(ThemeType) onThemeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themeLabels.length,
      itemBuilder: (context, index) {
        final entry = themeLabels.entries.elementAt(index);
        final isSelected = entry.key == selectedType;

        return ThemeListTileWidget(
          label: entry.value,
          selected: isSelected,
          onTap: () => onThemeSelected(entry.key),
        );
      },
    );
  }
}
