import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/theme.dart';
import '../../../blocs/counter/bloc.dart';
import '../../../i18n/translations.g.dart';

class Home_Text_CurrentCount extends StatelessWidget {
  const Home_Text_CurrentCount({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select<Counter_Bloc, int>((bloc) => bloc.state.count);

    return Text(
      context.t.home.currentCount(count: count),
      style: context.theme.typography.lg,
    );
  }
}
