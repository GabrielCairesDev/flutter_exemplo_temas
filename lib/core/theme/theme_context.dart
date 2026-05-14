import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/ui/theme/view_models/theme_view_model.dart';
import 'package:provider/provider.dart';

extension ThemeContext on BuildContext {
  ThemeViewModel get theme => watch<ThemeViewModel>();
}
