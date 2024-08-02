import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_event.dart';
import 'package:learn_bloc/features/counter/bloc/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    _increase(BuildContext context) {
      context.read<CounterBloc>().add(IncreaseEvent());
    }

    _decrease(BuildContext context) {
      context.read<CounterBloc>().add(DecreaseEvent());
    }
    return CounterProvier(child: Scaffold(
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Count $state",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => _increase(context),
                      child: Text("Incresea")),
                  ElevatedButton(
                      onPressed: () => _decrease(context),
                      child: Text("Decresea"))
                ],
              )
            ],
          );
        },
      ),
    ));
  }
}
