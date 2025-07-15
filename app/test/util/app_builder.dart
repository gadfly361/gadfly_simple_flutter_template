import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/app/builder.dart';
import 'package:my_app/inside/i18n/translations.g.dart';

import 'mocks/mocked_app.dart';

FutureOr<Widget> testAppBuilder({
  required Key key,
  required MocksContainer mocks,
  required ThemeMode themeMode,
}) async {
  mocks.mockEffectProviderGetEffectMethods();

  return await appBuilder(
    key: key,
    appLocale: AppLocale.en,
    themeMode: themeMode,
    effectProviders: mocks.effectProviders,
    repositories: mocks.repositories,
  );
}
