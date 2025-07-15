import '../../effect_providers/shared_preferences/effect.dart';
import '../../effect_providers/shared_preferences/effect_provider.dart';
import '../base.dart';

class Repository_Persistence extends Repository_Base {
  Repository_Persistence({
    required this.sharedPreferencesEffectProvider,
  });

  final SharedPreferences_EffectProvider sharedPreferencesEffectProvider;
  late final SharedPreferences_Effect sharedPreferencesEffect;

  @override
  Future<void> init() async {
    sharedPreferencesEffect = sharedPreferencesEffectProvider.getEffect();
  }

  Future<int?> getInt(String key) async {
    return sharedPreferencesEffect.getInt(key);
  }

  Future<bool> saveInt(String key, int value) async {
    return sharedPreferencesEffect.setInt(key, value);
  }
}
