import 'dart:async';

import 'package:learn_bloc/features/remote/bloc/remote_event.dart';
import 'package:learn_bloc/features/remote/bloc/remote_state.dart';

class RemoteBloc {
  var remote = RemoteState(70);

  StreamController<RemoteEvent> eventController =
      StreamController<RemoteEvent>();
  StreamController<RemoteState> stateController =
      StreamController<RemoteState>();

  RemoteBloc() {
    eventController.stream.listen((RemoteEvent event) {
      if (event is IncreaseEvent) {
        remote = RemoteState(remote.volume + event.volume);
      } else if (event is DecrementEvent) {
        remote = RemoteState(remote.volume - 1);
      } else {
        remote = RemoteState(0);
      }

      stateController.sink.add(remote);
    });
  }
}
