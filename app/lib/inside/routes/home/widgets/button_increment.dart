import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/counter/bloc.dart';
import '../../../blocs/counter/events.dart';
import '../../../i18n/translations.g.dart';

class Home_Button_Increment extends StatelessWidget {
  const Home_Button_Increment({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent),
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        final counterBloc = context.read<Counter_Bloc>();
        counterBloc.add(const Counter_Increment());
      },
      child: Text(context.t.home.increment),
    );
  }
}
