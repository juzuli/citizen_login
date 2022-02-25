import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndz_firebase/src/cubit/authentication/authentication_cubit.dart';
import 'package:ndz_firebase/src/cubit/authentication/authentication_repository.dart';

import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationCubit(AuthRepository())),
      ],
      child: MaterialApp(
        title: 'Firebase example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
