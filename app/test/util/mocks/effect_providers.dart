import 'package:mocktail/mocktail.dart';
import 'package:my_app/outside/effect_providers/mixpanel/effect_provider.dart';
import 'package:my_app/outside/effect_providers/shared_preferences/effect_provider.dart';

class MockMixpanelEffectProvider extends Mock
    implements Mixpanel_EffectProvider {}

class MockSharedPreferencesEffectProvider extends Mock
    implements SharedPreferences_EffectProvider {}
