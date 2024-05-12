import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const  ColorScheme.light(
          primary:GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 42, 95, 200),
          elevation: 0,
          iconTheme:  IconThemeData(
          color: Colors.black,
        ),

        // useMaterial3: true,
      ),
    ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  const AuthScreen(),
    );
  }
}
