import 'package:flutter/material.dart';
import 'package:kappuru/utilities/TextView.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  var size;

  PrimaryButton(
      {required this.text, required this.size, required this.onPressed});

  bool isButtonEnabled() {
    return size == 10;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isButtonEnabled() ? const Color(0xFFD62958) : Colors.white,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            isButtonEnabled() ? Colors.white : const Color(0xFFD62958),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                color: isButtonEnabled()
                    ? const Color(0xFFD62958)
                    : const Color(0xFFD62958),
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
