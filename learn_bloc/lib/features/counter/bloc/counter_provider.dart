import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_bloc.dart';

class CounterProvier extends StatelessWidget {
  final Widget child;
  const CounterProvier({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: child,
    );
  }
}
