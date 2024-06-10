import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/common/styles.dart';

class PPButtons{

  // Continue Button Widget
  Widget buildContinueButton() {
    return Container(
      width: 343,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF9747FF), Color(0xFF5A2A99)],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Add your onPressed code here!
          if (kDebugMode) {
            print('Continue Button Pressed');
          }
        },
        child: const Text('CONTINUE', style: PPStyle.buttonTextStyle),
      ),
    );
  }
}