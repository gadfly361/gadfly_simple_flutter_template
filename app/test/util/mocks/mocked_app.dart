import 'package:flow_test/flow_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/outside/effect_providers/all.dart';
import 'package:my_app/outside/effect_providers/mixpanel/effect_fake.dart';
import 'package:my_app/outside/repositories/all.dart';
import 'package:my_app/outside/theme/theme.dart';

import '../app_builder.dart';
import 'effect_providers.dart';
import 'effects.dart';
import 'repositories.dart';

List<MockedApp> createdMockedApps() => [
  MockedApp(
    key: const Key('zincLight'),
    events: [],
    mocks: MocksContainer(),
    theme: OutsideThemes.lightTheme,
  ),
  MockedApp(
    key: const Key('zincDark'),
    events: [],
    mocks: MocksContainer(),
    theme: OutsideThemes.darkTheme,
  ),
];

class MockedApp extends FTMockedApp<MocksContainer> {
  MockedApp({
    required Key key,
    required super.events,
    required super.mocks,
    required OutsideTheme theme,
  }) : super(
         appBuilder: () async => await testAppBuilder(
           key: key,
           mocks: mocks,
           theme: theme,
         ),
       );
}

class MocksContainer {
  final repositories = Repositories_All(
    persistenceRepository: MockRepository_Persistence(),
  );

  final effectProviders = EffectProviders_All(
    mixpanelEffectProvider: MockMixpanelEffectProvider(),
    sharedPreferencesEffectProvider: MockSharedPreferencesEffectProvider(),
  );

  final effects = AllMockedEffects(
    // Note: this is a special case where we are returning a Fake instead of a
    // Mock. Normally, we want to exclusively return Mocks.
    mixpanelEffect: Effect_Mixpanel_Fake(),
    sharedPreferencesEffect: MockSharedPreferences_Effect(),
  );

  // As a convenience, we can mock all of the effect providers' getEffect method
  // to return our mocked effects. So be sure to mock the getEffect methods for
  // all new effect providers.
  void mockEffectProviderGetEffectMethods() {
    when(
      effectProviders.mixpanelEffectProvider.getEffect,
    ).thenReturn(effects.mixpanelEffect);

    when(
      effectProviders.sharedPreferencesEffectProvider.getEffect,
    ).thenReturn(effects.sharedPreferencesEffect);
  }
}
