import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as logging;

import '../../inside/i18n/translations.g.dart';
import '../../outside/client_providers/sentry/client_provider_configuration.dart';
import '../../outside/effect_providers/mixpanel/effect_provider_configuration.dart';

class AppConfiguration {
  const AppConfiguration({
    required this.appLocale,
    required this.logLevel,
    required this.themeMode,
    required this.clientProvidersConfigurations,
    required this.effectProvidersConfigurations,
  });

  final AppLocale appLocale;
  final logging.Level logLevel;
  final ThemeMode themeMode;

  final ClientProvidersConfigurations clientProvidersConfigurations;
  final EffectProvidersConfigurations effectProvidersConfigurations;
}

class ClientProvidersConfigurations {
  ClientProvidersConfigurations({
    required this.sentry,
  });

  final Sentry_ClientProvider_Configuration? sentry;
}

class EffectProvidersConfigurations {
  EffectProvidersConfigurations({
    required this.mixpanel,
  });

  final Mixpanel_EffectProvider_Configuration mixpanel;
}
