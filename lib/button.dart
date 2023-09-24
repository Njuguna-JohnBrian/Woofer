import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final VoidCallback voidCallbackFunction;
  final String buttonText;
  final ButtonStyle buttonStyle;
  final TextStyle textStyle;

  const ReusableButton({
    super.key,
    required this.voidCallbackFunction,
    required this.buttonText,
    required this.buttonStyle,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          30,
        ),
        child: TextButton(
          onPressed: voidCallbackFunction,
          style: buttonStyle,
          child: Text(
            buttonText,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
