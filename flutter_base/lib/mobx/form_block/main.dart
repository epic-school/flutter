import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'errors_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ValidateBloc>(
        create: (context) => ValidateBloc(),
        child: const AppForm(),
      ),
    );
  }
}

class AppForm extends StatefulWidget {
  const AppForm({Key? key}) : super(key: key);
  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {

  @override
  Widget build(BuildContext context) {
    ValidateBloc bloc = BlocProvider.of<ValidateBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signum form'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              BlocBuilder<ValidateBloc, MissageErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidateEventName(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Pick a username',
                    errorText: state.nameMessage,
                  ),
                ),
              ),
              BlocBuilder<ValidateBloc, MissageErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidateEventEmail(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText: state.emailMessage,
                  ),
                ),
              ),
              BlocBuilder<ValidateBloc, MissageErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidateEventPassword(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Set a password',
                    errorText: state.passwordMessage,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
