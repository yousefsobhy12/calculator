import 'package:calculator/widgets/number_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeView extends StatefulWidget {
  static const String pageRoute = 'homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String onScreenDigit = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1B20),
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 200,
            width: double.infinity,
            child: Text(
              onScreenDigit,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(
                  text: 'C',
                  onClick: clear,
                ),
                NumberButton(
                  text: '√',
                  onClick: squareRoot,
                ),
                NumberButton(
                  text: 'X²',
                  onClick: squareExponent,
                ),
                NumberButton(
                  text: '⌫',
                  onClick: delete,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(
                  text: '7',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '8',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '9',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '/',
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(
                  text: '4',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '5',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '6',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '*',
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(
                  text: '1',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '2',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '3',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '-',
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberButton(
                  text: '.',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '0',
                  onClick: onClickButton,
                ),
                NumberButton(
                  text: '=',
                  onClick: onEqual,
                ),
                NumberButton(
                  text: '+',
                  onClick: onOperatorClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onEqual(String _) {
    String rhs = onScreenDigit;
    savedNumber = calculate(savedNumber, savedOperator, rhs);
    onScreenDigit = savedNumber;
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  void delete(String _) {
    setState(() {
      if (onScreenDigit.isNotEmpty) {
        onScreenDigit = onScreenDigit.substring(0, onScreenDigit.length - 1);
      }
    });
  }

  void clear(String _) {
    setState(() {
      savedOperator = '';
      savedNumber = '';
      onScreenDigit = '';
    });
  }

  void squareRoot(String _) {
    setState(() {
      double num = sqrt(double.parse(onScreenDigit));
      onScreenDigit = num.toString();
    });
  }

  void squareExponent(String _)
  {
    setState(() {
      double num = double.parse(onScreenDigit);
      double res = num * num;
      onScreenDigit = res.toString();
    });
  }

  String savedOperator = '';
  String savedNumber = '';

  void onOperatorClick(String operatorText) {
    if (savedOperator.isEmpty) {
      savedNumber = onScreenDigit;
    } else {
      String rhs = onScreenDigit;
      savedNumber = calculate(savedNumber, savedOperator, rhs);
    }
    savedOperator = operatorText;
    onScreenDigit = '';
    setState(() {});
  }

  String calculate(String lhs, String op, String rhs) {
    double num1 = double.parse(savedNumber);
    double num2 = double.parse(rhs);
    double? res;
    if (op == '+') {
      res = num1 + num2;
    } else if (op == '-') {
      res = num1 - num2;
    } else if (op == '*') {
      res = num1 * num2;
    } else if (op == '/') {
      res = num1 / num2;
    }
    return res.toString();
  }

  void onClickButton(String digitText) {
    setState(() {
      onScreenDigit += digitText;
    });
  }
}
