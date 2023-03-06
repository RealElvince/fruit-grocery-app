import 'package:flutter/material.dart';
import 'package:groceryapp/Screens/onboarding_screen.dart';
import 'package:groceryapp/models/cart_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const GroceryApp());

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Grocery App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const OnboardingScreen(),
      ),
    );
  }
}
