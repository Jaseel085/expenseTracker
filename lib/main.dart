import 'package:expense_tracker/features/screen/expense_Show_screen.dart';
import 'package:flutter/material.dart';
var wi;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    wi=MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ExpenseShowScreen(
      )
    );
  }
}


