import 'package:flutter/material.dart';
import 'package:groceryapp/constants.dart';
import 'package:groceryapp/Screens/groceryhome_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // shopping cart logo
          Padding(
            padding: const EdgeInsets.only(
                left: 60.0, right: 60, bottom: 30.0, top: 100.0),
            child: Image.asset('images/grocery.png'),
          ),
          //  welcome delivery
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Welcome to the convenient grocery delivery service.',
              textAlign: TextAlign.center,
              style: kDeliberyGroceryTextStyle,
            ),
          ),
          // buy fresh fruits
          const Text('Buy fresh fruits,everyday is grocery day!'),

          // get started button
          const SizedBox(height: 20.0),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const GroceryHomePage();
              }),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: kGetStartButtonColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kGetStartButtonColorText),
                ),
              ),
            ),
          ),

          const Spacer()
        ],
      ),
    );
  }
}
