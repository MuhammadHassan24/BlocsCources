import 'package:bloc_counter_app/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_counter_app/ui/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const CounterPage(),
        ),
      ),
    );
  }
}
