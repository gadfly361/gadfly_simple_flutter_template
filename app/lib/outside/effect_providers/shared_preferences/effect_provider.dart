// coverage:ignore-file
import 'package:shared_preferences/shared_preferences.dart';

import '../base.dart';
import 'effect.dart';

class SharedPreferences_EffectProvider
    extends EffectProvider_Base<SharedPreferences_Effect> {
  SharedPreferences_EffectProvider({
    required String prefix,
  }) : _prefix = prefix;

  final String _prefix;
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    SharedPreferences.setPrefix(_prefix);
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  SharedPreferences_Effect getEffect() {
    return SharedPreferences_Effect(sharedPreferences: _sharedPreferences);
  }
}
