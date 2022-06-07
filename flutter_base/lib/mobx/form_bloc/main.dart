import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_bloc.dart';

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
              BlocBuilder<ValidateBloc, FormErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidateUsernameEvent(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Pick a username',
                    errorText: state.errorUsername,
                  ),
                ),
              ),
              BlocBuilder<ValidateBloc, FormErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidateEmailEvent(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText: state.errorEmail,
                  ),
                ),
              ),
              BlocBuilder<ValidateBloc, FormErrorState>(
                bloc: bloc,
                builder: (context, state) => TextField(
                  onChanged: (value) {
                    bloc.add(ValidatePasswordEvent(value));
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Set a password',
                    errorText: state.errorPassword,
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
