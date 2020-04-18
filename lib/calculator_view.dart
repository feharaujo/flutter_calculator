import 'package:flutter/material.dart';
import 'package:fluttercalculator/ui/calculator_button.dart';
import 'package:fluttercalculator/ui/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorView extends StatelessWidget {
  final firstRow = [
    CalculatorButton(text: "AC"),
    CalculatorButton(text: "+/-"),
    CalculatorButton(text: "%"),
    CalculatorButton(text: "÷", textColor: kOrange, textSize: 45)
  ];

  final secondRow = [
    CalculatorButton(text: "7"),
    CalculatorButton(text: "8"),
    CalculatorButton(text: "9"),
    CalculatorButton(text: "x", textColor: kOrange),
  ];

  final thirdRow = [
    CalculatorButton(text: "4"),
    CalculatorButton(text: "5"),
    CalculatorButton(text: "6"),
    CalculatorButton(text: "-", textColor: kOrange, textSize: 45),
  ];

  final fourthRow = [
    CalculatorButton(text: "1"),
    CalculatorButton(text: "2"),
    CalculatorButton(text: "3"),
    CalculatorButton(text: "+", textColor: kOrange, textSize: 45),
  ];

  final fifthRow = [
    CalculatorButton(text: "0", isPill: true),
    CalculatorButton(text: "."),
    CalculatorButton(text: "=", textColor: kOrange, textSize: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        bottom: true,
        left: false,
        right: false,
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              Text(
                "3670",
                style: GoogleFonts.montserrat(
                  fontSize: 100,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Spacer(),

              DefaultPaddingRow(children: firstRow),
              DefaultPaddingRow(children: secondRow),
              DefaultPaddingRow(children: thirdRow),
              DefaultPaddingRow(children: fourthRow),
              DefaultPaddingRow(children: fifthRow),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultPaddingRow extends StatelessWidget {
  const DefaultPaddingRow({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
