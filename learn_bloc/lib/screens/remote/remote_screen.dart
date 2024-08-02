import 'package:flutter/material.dart';
import 'package:learn_bloc/features/remote/bloc/remote_bloc.dart';
import 'package:learn_bloc/features/remote/bloc/remote_event.dart';
import 'package:learn_bloc/features/remote/bloc/remote_state.dart';

class RemoteScreen extends StatefulWidget {
  const RemoteScreen({super.key});

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = RemoteBloc();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<RemoteState>(
            stream: bloc.stateController.stream,
            initialData: bloc.remote,
            builder: (context, snapshot) =>
                Text("VOLUME: ${snapshot.data?.volume}"),
          ),
          Center(child: ElevatedButton(onPressed:() => bloc.eventController.sink.add(IncreaseEvent(1)), child: Icon(Icons.one_k_plus)))
        ],
      ),
    );
  }
}
