import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

import '../../inside/i18n/translations.g.dart';
import '../../outside/effect_providers/mixpanel/effect_provider_configuration.dart';
import '../runner.dart';
import 'configuration.dart';

void main() {
  final configuration = AppConfiguration(
    appLocale: AppLocale.en,
    logLevel: logging.Level.ALL,
    themeMode: ThemeMode.system,
    clientProvidersConfigurations: ClientProvidersConfigurations(
      sentry: null,
    ),
    effectProvidersConfigurations: EffectProvidersConfigurations(
      mixpanel: const Mixpanel_EffectProvider_Configuration(
        sendEvents: false,
        token: null,
        environment: null,
      ),
    ),
  );

  appRunner(configuration: configuration);
}
