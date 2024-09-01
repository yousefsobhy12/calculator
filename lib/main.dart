import 'package:calculator/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.pageRoute: (_) => HomeView(),
      },
      initialRoute: HomeView.pageRoute,
    );
  }
}
