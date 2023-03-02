import 'package:example_cubit/cubit/greeting_cubit.dart';
import 'package:example_cubit/cubit/greeting_state.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<GreetingCubit>(
        create: (context) => GreetingCubit(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              TextMessage(),
              TextButton(
                onPressed: () {
                  final greetingCubit = context.read<GreetingCubit>();
                  greetingCubit.getNextGreetingstate();
                },
                child: Text('Proxima visita'),
              ),
              TextButton(
                onPressed: () {
                  final greetingCubit = context.read<GreetingCubit>();
                  greetingCubit.resetCouting();
                },
                child: Text('Zerar contagem'),
              ),
            ],
          )),
    );
  }
}

class TextMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetingCubit, GreetingState>(
      builder: (context, state) {
        String message = '';

        if (state is GreetingInitial) {
          message = 'Bem vindo';
        } else if (state is GreetingSecondTime) {
          message = 'É seu segundo acesso, parabens';
        } else if (state is GreetingThirdTime) {
          message = 'Seu terceiro acesso';
        } else {
          message = 'Bem vindo novamente';
        }

        return Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        );
      },
    );
  }
}
