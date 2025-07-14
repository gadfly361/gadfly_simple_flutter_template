import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/widgets/button.dart';

import '../../../blocs/counter/bloc.dart';
import '../../../blocs/counter/events.dart';
import '../../../i18n/translations.g.dart';

class Home_Button_Increment extends StatelessWidget {
  const Home_Button_Increment({super.key});

  @override
  Widget build(BuildContext context) {
    return FButton(
      label: Text(context.t.home.increment),
      style: FButtonStyle.primary,
      onPress: () {
        final counterBloc = context.read<Counter_Bloc>();
        counterBloc.add(const Counter_Increment());
      },
    );
  }
}
