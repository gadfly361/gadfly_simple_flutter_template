import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/counter/bloc.dart';
import '../../../blocs/counter/events.dart';
import '../../../i18n/translations.g.dart';

class Home_Button_Reset extends StatelessWidget {
  const Home_Button_Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final counterBloc = context.read<Counter_Bloc>();
        counterBloc.add(const Counter_Event_Reset());
      },
      child: Text(context.t.home.reset),
    );
  }
}
