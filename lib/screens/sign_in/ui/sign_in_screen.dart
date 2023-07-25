import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_with_bloc/screens/sign_in/bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        context.read<SignInBloc>().add(SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                      },
                      decoration: InputDecoration(
                          errorText: (state is SignInErrorState)
                              ? state.errorMessage
                              : null,
                          hintText: "E-mail adres"),
                    ),
                    TextField(
                      onChanged: (value) {
                        context.read<SignInBloc>().add(SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                      },
                      controller: passwordController,
                      decoration: InputDecoration(hintText: "Parola "),
                      obscureText: true,
                    ),
                    ElevatedButton(
                        onPressed: (state is SignInValidState)
                            ? () {
                                context.read<SignInBloc>().add(
                                    SignInTextChangedEvent(emailController.text,
                                        passwordController.text));
                              }
                            : null,
                        child: Text("Sign_ın"))
                  ]),
            ),
          ),
        );
      },
    );
  }
}
