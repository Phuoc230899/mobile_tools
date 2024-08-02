class RemoteEvent {}

class IncreaseEvent extends RemoteEvent{
  final int volume;

  IncreaseEvent(this.volume);
}

class DecrementEvent extends RemoteEvent{
  final int volume;

  DecrementEvent(this.volume);
}

class MuteEvent extends RemoteEvent{}
