import 'package:flutter_bloc/flutter_bloc.dart';

import 'base.dart';
import 'persistence/repository.dart';

/// When adding a new repository, be sure to add it to:
/// - [getList]
/// - [createProviders]
///   - Make sure to add the concrete type to `RepositoryProvider<ConcreteType>`
///     otherwise it will register the base class.
class Repositories_All {
  const Repositories_All({
    required this.persistenceRepository,
  });

  final Repository_Persistence persistenceRepository;

  List<Repository_Base> getList() => [
    persistenceRepository,
  ];

  List<RepositoryProvider<Repository_Base>> createProviders() {
    return [
      RepositoryProvider<Repository_Persistence>(
        create: (context) => persistenceRepository,
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
