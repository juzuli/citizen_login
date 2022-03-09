import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndz_firebase/src/cubit/authentication/authentication_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Email"),
            controller: emailController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            controller: passwordController,
            obscureText: true,
          ),
          BlocConsumer<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if(state is AuthenticationSuccess){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginPage()));
              }else if(state is AuthenticationError){
                Fluttertoast.showToast(msg: "Login Failed");
              }
            },
            builder: (context, state) {
              if (state is AuthenticationLoading) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      BlocProvider.of<AuthenticationCubit>(context)
                          .signInUserEmailPassword(email, password);
                    },
                    child: const Text("Login"));
              }
            },
          )
        ],
      ),
    );
  }
}
