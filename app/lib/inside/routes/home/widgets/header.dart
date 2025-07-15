import 'package:flutter/material.dart';

import '../../../i18n/translations.g.dart';

class Home_Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const Home_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final title = context.t.home.title;

    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
