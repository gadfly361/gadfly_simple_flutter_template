import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

import '../../inside/i18n/translations.g.dart';
import '../../outside/client_providers/sentry/client_provider_configuration.dart';
import '../../outside/effect_providers/mixpanel/effect_provider_configuration.dart';
import '../runner.dart';
import 'configuration.dart';

// TODO: update CHANGE_ME lines

void main() {
  final configuration = AppConfiguration(
    appLocale: AppLocale.en,
    logLevel: logging.Level.INFO,
    themeMode: ThemeMode.system,
    clientProvidersConfigurations: ClientProvidersConfigurations(
      sentry: const Sentry_ClientProvider_Configuration(
        dsn: 'CHANGE_ME',
        environment: 'production',
        tracesSampleRate: 0,
      ),
    ),
    effectProvidersConfigurations: EffectProvidersConfigurations(
      mixpanel: const Mixpanel_EffectProvider_Configuration(
        sendEvents: true,
        token: 'CHANGE_ME',
        environment: 'CHANGE_ME',
      ),
    ),
  );

  appRunner(configuration: configuration);
}
