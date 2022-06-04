import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_form_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<MyFormBloc>(
        create: (context) => MyFormBloc(),
        child: const AppForm(),
      ),
    );
  }
}

class AppForm extends StatelessWidget {
  const AppForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<MyFormBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup form'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              BlocBuilder<MyFormBloc, MyFormState>(
                bloc: _bloc,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      _bloc.add(UsernameChanged(value));
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Pick a username',
                      errorText: state.errorUsername,
                    ),
                  );
                },
              ),
              BlocBuilder<MyFormBloc, MyFormState>(
                bloc: _bloc,
                builder: (context, state) {
                  return AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: state.isUsernameCheck ? 1 : 0,
                      child: const LinearProgressIndicator());
                },
              ),
              BlocBuilder<MyFormBloc, MyFormState>(
                bloc: _bloc,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      _bloc.add(EmailChanged(value));
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      errorText: state.errorEmail,
                    ),
                  );
                },
              ),
              BlocBuilder<MyFormBloc, MyFormState>(
                bloc: _bloc,
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) {
                      _bloc.add(PasswordChanged(value));
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Set a password',
                        errorText: state.errorPassword
                    ),
                  );
                },
              ),
              BlocBuilder<MyFormBloc, MyFormState>(
                bloc: _bloc,
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      _bloc.add(FormSubmitted());
                      if (state.noErrors) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                                content: Text('Registration Success')),
                          );
                      }
                    },
                    child: const Text('Sign up'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
