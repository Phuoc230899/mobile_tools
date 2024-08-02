import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_event.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_state.dart';

class Remote2Bloc extends Bloc<Remote2Event, int> {
  Remote2Bloc() : super(70) {
    on<IncreseaEvent2>((event, emit) => _incresea(emit));
    on<DecreseaEvent2>((event, emit) => _decresea(emit));
    on<MuteEvent2>((event, emit) => _mute(emit));
  }

  _incresea(Emitter emit) {
    emit(state + 1);
  }

  _decresea(Emitter emit) {
    if (state >= 1) {
      emit(state - 1);
    }
  }

  _mute(Emitter emit) {
    emit(0);
  }
}
