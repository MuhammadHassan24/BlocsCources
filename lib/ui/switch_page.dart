import 'package:bloc_counter_app/bloc/switch/switch_bloc.dart';
import 'package:bloc_counter_app/bloc/switch/switch_event.dart';
import 'package:bloc_counter_app/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch Page")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Switch is: ${context.watch<SwitchBloc>().state.isEnabled ? "Enabled " : "Disabled"}",
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isEnabled,
                    onChanged: (value) {
                      print(state.isEnabled);
                      print(value);
                      context.read<SwitchBloc>().add(EnableAndDisableSwitch());
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Container(
                width: 280,
                height: 150,
                color: Colors.red.withValues(alpha: state.slider),
              );
            },
          ),
          SizedBox(height: 50),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Slider(
                value: state.slider,
                onChanged: (value) {
                  print(value);
                  print(state.slider);
                  context.read<SwitchBloc>().add(
                    SliderEvent(sliderValue: value),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
