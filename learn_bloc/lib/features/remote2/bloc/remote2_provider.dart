import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/remote2/bloc/remote2_bloc.dart';

class RemoteProvider extends StatelessWidget {
  final Widget child;
  const RemoteProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Remote2Bloc>(
      create: (BuildContext context) => Remote2Bloc(),
      child: child,
    );
  }
}
