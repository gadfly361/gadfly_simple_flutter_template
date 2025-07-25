import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/persistence/repository.dart';
import '../base.dart';
import 'events.dart';
import 'state.dart';

class Counter_Bloc extends Bloc_Base<Counter_Event, Counter_State> {
  Counter_Bloc({
    required this.persistenceRepository,
  }) : super(const Counter_State(count: 0)) {
    on<Counter_Event_Initialize>(onCounterInitialize);
    on<Counter_Event_Increment>(onIncrement);
    on<Counter_Event_Decrement>(onDecrement);
    on<Counter_Event_Reset>(onReset);

    add(const Counter_Event_Initialize());
  }

  static const String counterKey = 'home/counter';

  final Repository_Persistence persistenceRepository;

  Future<void> onCounterInitialize(
    Counter_Event_Initialize event,
    Emitter<Counter_State> emit,
  ) async {
    try {
      final savedCount = await persistenceRepository.getInt(counterKey) ?? 0;
      emit(
        state.copyWith(
          count: savedCount,
        ),
      );
    } catch (e, st) {
      log.warning('Failed to load $counterKey value', e, st);
    }
  }

  Future<void> onIncrement(
    Counter_Event_Increment event,
    Emitter<Counter_State> emit,
  ) async {
    final updatedCount = state.count + 1;
    try {
      await persistenceRepository.saveInt(counterKey, updatedCount);
    } catch (e, st) {
      log.warning('Failed to save $counterKey value', e, st);
    } finally {
      emit(
        state.copyWith(
          count: updatedCount,
          setCountChangedBy: () => updatedCount - state.count,
        ),
      );
      emit(
        state.copyWith(
          setCountChangedBy: () => null,
        ),
      );
    }
  }

  Future<void> onDecrement(
    Counter_Event_Decrement event,
    Emitter<Counter_State> emit,
  ) async {
    final updatedCount = state.count - 1;
    try {
      await persistenceRepository.saveInt(counterKey, updatedCount);
    } catch (e, st) {
      log.warning('Failed to save home/counter value', e, st);
    } finally {
      emit(
        state.copyWith(
          count: updatedCount,
          setCountChangedBy: () => updatedCount - state.count,
        ),
      );
      emit(
        state.copyWith(
          setCountChangedBy: () => null,
        ),
      );
    }
  }

  Future<void> onReset(
    Counter_Event_Reset event,
    Emitter<Counter_State> emit,
  ) async {
    const updatedCount = 0;
    try {
      await persistenceRepository.saveInt(counterKey, updatedCount);
    } catch (e, st) {
      log.warning('Failed to save $counterKey value', e, st);
    } finally {
      emit(
        state.copyWith(
          count: updatedCount,
          setCountChangedBy: () => updatedCount - state.count,
        ),
      );
      emit(
        state.copyWith(
          setCountChangedBy: () => null,
        ),
      );
    }
  }
}
