import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base.dart';
import 'events.dart';
import 'state.dart';

class Counter_Bloc extends Bloc_Base<Counter_Event, Counter_State> {
  Counter_Bloc() : super(const Counter_State(count: 0)) {
    on<Counter_Increment>(onIncrement);
    on<Counter_Decrement>(onDecrement);
    on<Counter_Reset>(onReset);
  }

  Future<void> onIncrement(
    Counter_Increment event,
    Emitter<Counter_State> emit,
  ) async {
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> onDecrement(
    Counter_Decrement event,
    Emitter<Counter_State> emit,
  ) async {
    emit(state.copyWith(count: state.count - 1));
  }

  Future<void> onReset(Counter_Reset event, Emitter<Counter_State> emit) async {
    emit(state.copyWith(count: 0));
  }
}
