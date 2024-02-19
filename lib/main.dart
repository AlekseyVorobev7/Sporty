import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guvoboso/firebase_options.dart';
import 'package:guvoboso/frames/login.dart';
import 'package:guvoboso/user/user_bloc.dart';

void main() async {
  final userBloc = UserBloc();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserBloc>(
        create: (context) => userBloc,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporty',
      home: LoginWidget(),
    );
  }
}
