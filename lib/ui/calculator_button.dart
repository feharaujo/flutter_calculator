import 'package:flutter/material.dart';
import 'package:fluttercalculator/ui/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final bool isPill;

  CalculatorButton({
    Key key,
    @required this.text,
    this.textColor,
    this.textSize,
    this.isPill = false,
  }) : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final squareSideLength = width / 5;
    final buttonWidth = squareSideLength * (widget.isPill ? 2.2 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);
    return SizedBox(
      height: buttonSize.height,
      width: buttonSize.width,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.all(width / 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(buttonSize.width),
                color: Color.fromRGBO(239, 238, 238, 1),
                boxShadow: _isPressed ? showInnerShadow() : showShadow(),
              ),
            ),
            Align(
              alignment: Alignment(widget.isPill ? -0.6 : 0, 0),
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                  fontSize: widget.textSize ?? 30,
                  fontWeight: FontWeight.w200,
                  color: widget.textColor ?? Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow> showShadow() {
    return [
      BoxShadow(
        blurRadius: 15,
        offset: -Offset(5, 5),
        color: Colors.white,
      ),
      BoxShadow(
        blurRadius: 15,
        offset: Offset(4.5, 4.5),
        color: kDarkShadow,
      )
    ];
  }

  List<BoxShadow> showInnerShadow() {
    return [
      BoxShadow(
        blurRadius: 15,
        offset: Offset(5, 5),
        color: Colors.white,
      ),
      BoxShadow(
        blurRadius: 15,
        offset: -Offset(4.5, 4.5),
        color: kDarkShadow,
      ),
    ];
  }
}