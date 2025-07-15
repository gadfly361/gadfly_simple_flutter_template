import 'package:mocktail/mocktail.dart';
import 'package:my_app/outside/effect_providers/mixpanel/effect.dart';
import 'package:my_app/outside/effect_providers/shared_preferences/effect.dart';

class AllMockedEffects {
  AllMockedEffects({
    required this.mixpanelEffect,
    required this.sharedPreferencesEffect,
  });

  final Mixpanel_Effect mixpanelEffect;
  final SharedPreferences_Effect sharedPreferencesEffect;
}

/// MixpanelEffect: This is an exception, but we don't need to crete a mock for
/// this effect because one already exists in the application code.

class MockSharedPreferences_Effect extends Mock
    implements SharedPreferences_Effect {}
