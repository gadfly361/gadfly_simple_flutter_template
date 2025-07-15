import 'package:flutter_bloc/flutter_bloc.dart';

import 'base.dart';
import 'mixpanel/effect_provider.dart';
import 'shared_preferences/effect_provider.dart';

/// When adding a new effect provider, be sure to add it to:
/// - [getList]
/// - [createProviders]
///   - Make sure to add the concrete type to `RepositoryProvider<ConcreteType>`
///     otherwise it will register the base class.
class EffectProviders_All {
  const EffectProviders_All({
    required this.mixpanelEffectProvider,
    required this.sharedPreferencesEffectProvider,
  });

  final Mixpanel_EffectProvider mixpanelEffectProvider;
  final SharedPreferences_EffectProvider sharedPreferencesEffectProvider;

  List<EffectProvider_Base<dynamic>> getList() => [
    mixpanelEffectProvider,
    sharedPreferencesEffectProvider,
  ];

  List<RepositoryProvider<EffectProvider_Base<dynamic>>> createProviders() {
    return [
      RepositoryProvider<Mixpanel_EffectProvider>.value(
        value: mixpanelEffectProvider,
      ),
      RepositoryProvider<SharedPreferences_EffectProvider>.value(
        value: sharedPreferencesEffectProvider,
      ),
    ];
  }

  Future<void> initialize() async {
    await Future.forEach(getList(), (r) async {
      r.log.fine('init');
      await r.init();
    });
  }
}
