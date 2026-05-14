import 'package:flutter/material.dart';
import 'package:flutter_exemplo_temas/core/theme/theme_context.dart';
import 'package:flutter_exemplo_temas/routing/app_routes.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/app_bar_widget.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/floating_action_button_widget.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/icon_button_widget.dart';
import 'package:flutter_exemplo_temas/ui/core/widgets/scaffold_widget.dart';
import 'package:flutter_exemplo_temas/ui/home/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVm = context.watch<HomeViewModel>();

    return ScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Flutter exemplo temas',
        actions: [
          IconButtonWidget(
            icon: Icons.settings,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.theme),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você apertou o botão vezes: ${homeVm.counter}',
              style: TextStyle(color: context.theme.textColor),
            ),
            const SizedBox(height: 16),
            Text(
              context.theme.emoji,
              style: TextStyle(
                color: context.theme.textColor,
              ).copyWith(fontSize: 48),
            ),
            Text(
              context.theme.name,
              style: TextStyle(
                color: context.theme.textColor,
              ).copyWith(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: homeVm.incrementCounter,
        child: const IconButtonWidget(icon: Icons.add),
      ),
    );
  }
}
