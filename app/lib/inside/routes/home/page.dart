import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/persistence/repository.dart';
import '../../../outside/theme/theme.dart';
import '../../blocs/counter/bloc.dart';
import 'widgets/button_decrement.dart';
import 'widgets/button_increment.dart';
import 'widgets/button_reset.dart';
import 'widgets/header.dart';
import 'widgets/text_current_count.dart';

@RoutePage()
class Home_Page extends StatelessWidget implements AutoRouteWrapper {
  const Home_Page({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter_Bloc(
        persistenceRepository: context.read<Repository_Persistence>(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Home_Header(),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Home_Text_CurrentCount(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.tokens.spacing.large,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Home_Button_Increment(),
                  SizedBox(height: context.tokens.spacing.small),
                  const Home_Button_Decrement(),
                  SizedBox(height: context.tokens.spacing.small),
                  const Home_Button_Reset(),
                  SizedBox(height: context.tokens.spacing.small),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
