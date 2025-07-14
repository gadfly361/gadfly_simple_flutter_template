import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../outside/theme/theme.dart';
import '../../blocs/counter/bloc.dart';
import '../../util/breakpoints.dart';
import '../widgets/scaffold.dart';
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
    return BlocProvider(create: (context) => Counter_Bloc(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    return Routes_Scaffold(
      breakpointType: InsideUtil_BreakpointType.constrained,
      scaffold: FScaffold(
        header: const Home_Header(),
        content: SingleChildScrollView(
          child: Column(
            children: [
              const Home_Text_CurrentCount(),
              SizedBox(height: context.tokens.spacing.medium),
              const Home_Button_Increment(),
              SizedBox(height: context.tokens.spacing.medium),
              const Home_Button_Decrement(),
              SizedBox(height: context.tokens.spacing.medium),
              const Home_Button_Reset(),
            ],
          ),
        ),
      ),
    );
  }
}
