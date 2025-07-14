import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../i18n/translations.g.dart';

class Home_Header extends StatelessWidget {
  const Home_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = context.t.home.title;

    return FHeader(
      title: Text(title),
    );
  }
}
