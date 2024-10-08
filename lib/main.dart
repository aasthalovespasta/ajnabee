import 'package:ajnabee/bloc/auth/auth_bloc.dart';
import 'package:ajnabee/bloc/home/bloc/home_bloc.dart';
import 'package:ajnabee/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:ajnabee/firebase_options.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:ajnabee/repositories/firebase_storage_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FirebaseRepository>(
              create: (context) => FirebaseRepository()),
          RepositoryProvider<FirebaseStoreageRepo>(
              create: (context) => FirebaseStoreageRepo()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                  create: (BuildContext context) => AuthBloc()),
              BlocProvider<HomeBloc>(
                  create: (BuildContext context) => HomeBloc()),
              BlocProvider<NavigationBloc>(
                  create: (BuildContext context) => NavigationBloc()),
            ],
            child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.amber,
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                //home: const RootPage(),
                home: RootPage())));
  }
}
