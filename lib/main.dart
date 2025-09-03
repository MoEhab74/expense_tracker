import 'dart:developer';
import 'package:expense_tracker/auth/auth_page.dart';
import 'package:expense_tracker/auth/login_page.dart';
import 'package:expense_tracker/auth/signup_page.dart';
import 'package:expense_tracker/cubits/add_expense_cubit/add_expense_cubit.dart';
import 'package:expense_tracker/cubits/expenses_cubit/expenses_cubit.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/helper/simple_observer.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/views/home_view.dart';
import 'package:expense_tracker/views/on_boarding_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Make sure that the Flutter binding is initialized before the app starts and it's ready to display the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive before anything else
  await Hive.initFlutter();
  log('Initialized Hive');
  // Register the adapter that you want to store
  Hive.registerAdapter(ExpenseAdapter());
  log('Registered ExpenseAdapter');
  // Open the user expenses box
  await Hive.openBox<Expense>('user_expenses');
  log('Opened user expenses box');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log('Initialized Firebase');

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExpensesCubit()),
        BlocProvider(create: (context) => AddExpenseCubit())
      ],
      child: MaterialApp(
        routes: {
          HomeView.homeRoute: (context) => HomeView(),
          OnBoardingView.onBoardingRoute: (context) => OnBoardingView(),
          LoginPage.loginRoute: (context) => LoginPage(),
          SignUpPage.signupRoute: (context) => SignUpPage(),
          // ProfileView.profileRoute: (context) => ProfileView(),
          AuthPage.authRoute: (context) => AuthPage(),
        },
        initialRoute: AuthPage.authRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff3F8782),
            brightness: Brightness.light,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
      ),
    );
  }
}
