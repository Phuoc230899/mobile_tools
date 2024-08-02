import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/remote/bloc/remote_bloc.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_bloc.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_event.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_provider.dart';

class Remote2Screen extends StatefulWidget {
  const Remote2Screen({super.key});

  @override
  State<Remote2Screen> createState() => _Remote2ScreenState();
}

class _Remote2ScreenState extends State<Remote2Screen> {
  _inscrease(BuildContext context) {
    context.read<Remote2Bloc>().add(IncreseaEvent2());
  }

  _descrease(BuildContext context) {
    context.read<Remote2Bloc>().add(DecreseaEvent2());
  }

  _mute(BuildContext context) {
    context.read<Remote2Bloc>().add(MuteEvent2());
  }

  @override
  Widget build(BuildContext context) {
    return RemoteProvider(child: Scaffold(
      body: BlocBuilder<Remote2Bloc, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Volume $state"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => _descrease(context),
                      child: Icon(Icons.skip_previous)),
                  ElevatedButton(
                      onPressed: () => _mute(context),
                      child: Icon(Icons.pause)),
                  ElevatedButton(
                      onPressed: () => _inscrease(context),
                      child: Icon(Icons.skip_next))
                ],
              )
            ],
          );
        },
      ),
    ));
  }
}
