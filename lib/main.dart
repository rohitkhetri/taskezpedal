import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskezpedal/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:taskezpedal/features/auth/presentation/screens/login_scree.dart';
import 'package:taskezpedal/features/auth/presentation/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Firebase Auth BLoC',
        initialRoute: '/signup',
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
        },
      ),
    );
  }
}