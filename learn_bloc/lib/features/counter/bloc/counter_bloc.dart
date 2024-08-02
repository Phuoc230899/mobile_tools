import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncreaseEvent>((event, emit) => _incresea(emit));
    on<DecreaseEvent>((event, emit) => _decresea(emit));
  }

  _incresea(Emitter emit) {
    emit(state + 1);
  }

  _decresea(Emitter emit) {
    emit(state - 1);
  }
}
